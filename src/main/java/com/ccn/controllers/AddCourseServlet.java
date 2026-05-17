package com.ccn.controllers;

import java.io.IOException;

import com.ccn.model.CourseModel;
import com.ccn.service.CourseService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/add-course")
public class AddCourseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CourseService courseService = new CourseService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/add-course.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        String category =
        	    request.getParameter("category");

        String instructor =
        	    request.getParameter("instructor");

        String status =
        	    request.getParameter("status");
        
        CourseModel course = new CourseModel();

        course.setTitle(title);
        course.setDescription(description);
        course.setCategory(category);
        course.setInstructor(instructor);
        course.setStatus(status);

        boolean result =
        	    courseService.addCourse(course);

        	if (result) {

        	    request.getSession().setAttribute(
        	        "successMessage",
        	        "Course added successfully!"
        	    );

        	    response.sendRedirect("courses");

        	} else {

        	    request.getSession().setAttribute(
        	        "errorMessage",
        	        "Failed to add course!"
        	    );

        	    response.sendRedirect("add-course");
        	}
    }
}