package com.ccn.controllers;

import java.io.IOException;

import com.ccn.service.SubmissionService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-submission")
public class DeleteSubmissionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SubmissionService submissionService =
        new SubmissionService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int submissionId =
                Integer.parseInt(
                    request.getParameter("id")
                );

            boolean result =
                submissionService.deleteSubmission(
                    submissionId
                );

            if (result) {

                request.getSession().setAttribute(
                    "successMessage",
                    "Submission deleted successfully!"
                );
            }

            response.sendRedirect("submissions");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("submissions");
        }
    }
}