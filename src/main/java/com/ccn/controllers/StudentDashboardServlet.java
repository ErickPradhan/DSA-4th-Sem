package com.ccn.controllers;

import java.io.IOException;

import com.ccn.service.AssignmentService;
import com.ccn.service.CourseService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/student-dashboard")
public class StudentDashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CourseService courseService = new CourseService();
    private AssignmentService assignmentService = new AssignmentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login");
            return;

        }

        // Dynamic Counts
        int totalCourses = courseService.getTotalCourses();
        int totalAssignments = assignmentService.getTotalAssignments();

        // Send data to JSP
        request.setAttribute("totalCourses", totalCourses);
        request.setAttribute("totalAssignments", totalAssignments);

        // Forward
        request.getRequestDispatcher("/WEB-INF/pages/student-dashboard.jsp")
               .forward(request, response);
    }

}