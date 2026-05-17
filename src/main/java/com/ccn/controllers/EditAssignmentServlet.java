package com.ccn.controllers;

import java.io.IOException;

import com.ccn.model.AssignmentModel;
import com.ccn.service.AssignmentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edit-assignment")
public class EditAssignmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AssignmentService assignmentService =
        new AssignmentService();

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

            String deadline =
                request.getParameter("deadline");

            String status =
                request.getParameter("status");

            AssignmentModel assignment =
                new AssignmentModel();

            assignment.setId(id);
            assignment.setTitle(title);
            assignment.setDeadline(deadline);
            assignment.setStatus(status);

            boolean result =
                assignmentService.updateAssignment(
                    assignment
                );

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