package com.ccn.controllers;

import java.io.IOException;
import java.util.List;

import com.ccn.model.SubmissionModel;
import com.ccn.service.AssignmentService;
import com.ccn.service.CourseService;
import com.ccn.service.SubmissionService;
import com.ccn.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserService();
    private CourseService courseService = new CourseService();
    private AssignmentService assignmentService = new AssignmentService();
    private SubmissionService submissionService = new SubmissionService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int totalStudents = userService.getTotalStudents();
        int totalCourses = courseService.getTotalCourses();
        int totalAssignments = assignmentService.getTotalAssignments();
        int totalSubmissions = submissionService.getTotalSubmissions();

        List<SubmissionModel> recentSubmissions = submissionService.getRecentSubmissions();

        request.setAttribute("totalStudents", totalStudents);
        request.setAttribute("totalCourses", totalCourses);
        request.setAttribute("totalAssignments", totalAssignments);
        request.setAttribute("totalSubmissions", totalSubmissions);

        request.setAttribute("recentSubmissions", recentSubmissions);

        request.getRequestDispatcher("/WEB-INF/pages/admin-dashboard.jsp")
                .forward(request, response);
    }
}