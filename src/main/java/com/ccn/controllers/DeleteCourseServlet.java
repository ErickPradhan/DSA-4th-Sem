package com.ccn.controllers;

import java.io.IOException;

import com.ccn.service.CourseService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-course")
public class DeleteCourseServlet extends HttpServlet {

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

            boolean result =
                courseService.deleteCourse(id);
            System.out.println("DELETE ID = " + id);
            System.out.println("DELETE RESULT = " + result);

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