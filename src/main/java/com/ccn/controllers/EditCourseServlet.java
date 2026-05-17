package com.ccn.controllers;

import java.io.IOException;

import com.ccn.model.CourseModel;
import com.ccn.service.CourseService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edit-course")
public class EditCourseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CourseService courseService =
        new CourseService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id =
                Integer.parseInt(
                    request.getParameter("id")
                );

            String title =
                request.getParameter("title");

            String category =
                request.getParameter("category");

            String instructor =
                request.getParameter("instructor");

            String status =
                request.getParameter("status");

            CourseModel course =
                new CourseModel();

            course.setId(id);
            course.setTitle(title);
            course.setCategory(category);
            course.setInstructor(instructor);
            course.setStatus(status);

            boolean result =
                courseService.updateCourse(course);
            
            System.out.println("RESULT = " + result);
            System.out.println("TITLE = " + title);
            System.out.println("CATEGORY = " + category);
            System.out.println("INSTRUCTOR = " + instructor);
            System.out.println("STATUS = " + status);

            if (result) {

                response.setStatus(
                    HttpServletResponse.SC_OK
                );

            } else {

                response.setStatus(
                    HttpServletResponse.SC_BAD_REQUEST
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setStatus(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR
            );
        }
    }
}