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

        List<AssignmentModel> assignments;

        String courseIdParam =
            request.getParameter("courseId");

        if (courseIdParam != null &&
            !courseIdParam.isEmpty()) {

            int courseId =
                Integer.parseInt(courseIdParam);

            assignments =
                assignmentService.getAssignmentsByCourseId(
                    courseId
                );

            request.setAttribute(
                "selectedCourseId",
                courseId
            );

        } else {

            assignments =
                assignmentService.getAllAssignments();
        }

        // TOTAL ASSIGNMENTS
        int totalAssignments =
            assignments.size();

        // ACTIVE ASSIGNMENTS
        int activeAssignments = 0;

        // DUE SOON ASSIGNMENTS
        int dueSoonAssignments = 0;

        for (AssignmentModel assignment : assignments) {

            if ("Active".equalsIgnoreCase(
                    assignment.getStatus())) {

                activeAssignments++;
            }

            if ("Due Soon".equalsIgnoreCase(
                    assignment.getStatus())) {

                dueSoonAssignments++;
            }
        }

        // PASS DATA TO JSP
        request.setAttribute(
            "assignments",
            assignments
        );

        request.setAttribute(
            "totalAssignments",
            totalAssignments
        );

        request.setAttribute(
            "activeAssignments",
            activeAssignments
        );

        request.setAttribute(
            "dueSoonAssignments",
            dueSoonAssignments
        );

        request.getRequestDispatcher(
            "/WEB-INF/pages/assignments.jsp"
        ).forward(request, response);
    }

}