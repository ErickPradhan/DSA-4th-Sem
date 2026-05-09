package com.ccn.controllers;

import java.io.IOException;
import java.util.List;

import com.ccn.model.AssignmentModel;
import com.ccn.service.AssignmentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/assignments")
public class AssignmentsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AssignmentService assignmentService =
        new AssignmentService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<AssignmentModel> assignments =
            assignmentService.getAllAssignments();

        request.setAttribute("assignments", assignments);

        request.getRequestDispatcher("/WEB-INF/pages/assignments.jsp")
               .forward(request, response);
    }

}