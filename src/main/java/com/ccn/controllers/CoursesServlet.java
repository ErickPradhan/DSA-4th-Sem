package com.ccn.controllers;

import java.io.IOException;
import java.util.List;

import com.ccn.model.CourseModel;
import com.ccn.service.CourseService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/courses")
public class CoursesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CourseService courseService =
        new CourseService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<CourseModel> courses =
            courseService.getAllCourses();

        request.setAttribute("courses", courses);

        request.getRequestDispatcher("/WEB-INF/pages/courses.jsp")
               .forward(request, response);
    }

}