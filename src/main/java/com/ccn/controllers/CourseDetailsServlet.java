package com.ccn.controllers;

import java.io.IOException;

import com.ccn.model.CourseModel;
import com.ccn.service.CourseService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/course-details")
public class CourseDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CourseService courseService =
        new CourseService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

    		String idParam =
    		    request.getParameter("id");

    		if (idParam == null || idParam.isEmpty()) {

    		    response.sendRedirect(
    		        request.getContextPath() + "/courses"
    		    );

    		    return;
    		}

    		int id =
    		    Integer.parseInt(idParam);

        CourseModel course =
            courseService.getCourseById(id);

        request.setAttribute("course", course);

        request.getRequestDispatcher("/WEB-INF/pages/course-details.jsp")
               .forward(request, response);
    }

}