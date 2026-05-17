package com.ccn.controllers;

import java.io.IOException;

import com.ccn.model.UserModel;
import com.ccn.service.AssignmentService;
import com.ccn.service.CourseService;
import com.ccn.service.SubmissionService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/student-dashboard")
public class StudentDashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CourseService courseService =
        new CourseService();

    private AssignmentService assignmentService =
        new AssignmentService();

    private SubmissionService submissionService =
        new SubmissionService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
            request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect("login");
            return;
        }

        UserModel user =
            (UserModel) session.getAttribute("user");
        
        System.out.println(
        	    "LOGGED IN USER ID: " + user.getId()
        	);

        // TOTAL COUNTS
        int totalCourses =
            courseService.getTotalCourses();

        int totalAssignments =
            assignmentService.getTotalAssignments();

        // COURSES
        request.setAttribute(
            "courses",
            courseService.getAllCourses()
        );

        // ASSIGNMENTS
        request.setAttribute(
            "dashboardAssignments",
            assignmentService.getRecentAssignments()
        );
        
        if (!assignmentService.getRecentAssignments().isEmpty()) {

            request.setAttribute(
                "latestAssignmentId",
                assignmentService
                    .getRecentAssignments()
                    .get(0)
                    .getId()
            );
        }

        // DEADLINES
        request.setAttribute(
            "recentAssignments",
            assignmentService.getRecentAssignments()
        );

        session.setAttribute(
        	    "recentSubmissions",
        	    submissionService.getSubmissionsByStudentId(user.getId())
        	);

        // TOTALS
        request.setAttribute(
            "totalCourses",
            totalCourses
        );

        request.setAttribute(
            "totalAssignments",
            totalAssignments
        );

        // FORWARD
        request.getRequestDispatcher(
            "/WEB-INF/pages/student-dashboard.jsp"
        ).forward(request, response);
    }
}