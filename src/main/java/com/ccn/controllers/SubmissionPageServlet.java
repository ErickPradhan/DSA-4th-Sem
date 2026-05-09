package com.ccn.controllers;

import java.io.IOException;

import com.ccn.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/submission")
public class SubmissionPageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String assignmentId =
            request.getParameter("assignmentId");

        HttpSession session =
            request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect("login");
            return;
        }

        UserModel user =
            (UserModel) session.getAttribute("user");

        if ("admin".equals(user.getRole())) {

            response.sendRedirect("assignments");
            return;
        }

        request.setAttribute(
            "assignmentId",
            assignmentId
        );

        request.getRequestDispatcher("/WEB-INF/pages/submission.jsp")
               .forward(request, response);
    }

}