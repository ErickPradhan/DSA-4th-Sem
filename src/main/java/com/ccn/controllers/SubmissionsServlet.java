package com.ccn.controllers;

import java.io.IOException;
import java.util.List;

import com.ccn.model.SubmissionModel;
import com.ccn.service.SubmissionService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/submissions")
public class SubmissionsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SubmissionService submissionService =
        new SubmissionService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<SubmissionModel> submissions =
            submissionService.getAllSubmissions();

        request.setAttribute(
            "submissions",
            submissions
        );

        request.getRequestDispatcher(
            "/WEB-INF/pages/submissions.jsp"
        ).forward(request, response);

    }

}