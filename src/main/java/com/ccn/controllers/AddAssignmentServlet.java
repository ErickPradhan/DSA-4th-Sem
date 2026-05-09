package com.ccn.controllers;

import java.io.IOException;
import java.util.List;

import com.ccn.model.AssignmentModel;
import com.ccn.model.CourseModel;
import com.ccn.service.AssignmentService;
import com.ccn.service.CourseService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add-assignment")
public class AddAssignmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AssignmentService assignmentService = new AssignmentService();
    private CourseService courseService = new CourseService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Load courses for dropdown
        List<CourseModel> courses = courseService.getAllCourses();

        request.setAttribute("courses", courses);

        request.getRequestDispatcher("/WEB-INF/pages/add-assignment.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int courseId =
            Integer.parseInt(request.getParameter("course_id"));

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String deadline = request.getParameter("deadline");

        AssignmentModel assignment = new AssignmentModel();

        assignment.setCourseId(courseId);
        assignment.setTitle(title);
        assignment.setDescription(description);
        assignment.setDeadline(deadline);

        boolean result =
            assignmentService.addAssignment(assignment);

        if (result) {

            request.getSession().setAttribute(
                "successMessage",
                "Assignment added successfully!"
            );

            response.sendRedirect("assignments");

        } else {

            request.getSession().setAttribute(
                "errorMessage",
                "Failed to add assignment!"
            );

            response.sendRedirect("add-assignment");
        }
    }

}