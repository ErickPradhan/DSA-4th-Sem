package com.ccn.controllers;

import java.io.IOException;
import java.util.List;

import com.ccn.model.AssignmentModel;
import com.ccn.model.SubmissionModel;
import com.ccn.model.UserModel;

import com.ccn.service.AssignmentService;
import com.ccn.service.SubmissionFileService;
import com.ccn.service.SubmissionService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/submission")
public class SubmissionServlet
        extends HttpServlet {

    private static final long
        serialVersionUID = 1L;

    private AssignmentService
        assignmentService =
            new AssignmentService();

    private SubmissionService
        submissionService =
            new SubmissionService();

    private SubmissionFileService
        submissionFileService =
            new SubmissionFileService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String assignmentIdParam =
                request.getParameter(
                    "assignment_id"
                );

            // AUTO REDIRECT TO LATEST ASSIGNMENT
            if (assignmentIdParam == null) {

                List<AssignmentModel> assignments =
                    assignmentService.getRecentAssignments();

                if (!assignments.isEmpty()) {

                    response.sendRedirect(
                        "submission?assignment_id=" +
                        assignments.get(0).getId()
                    );

                    return;
                }
            }

            HttpSession session =
                request.getSession(false);

            if (session == null ||
                session.getAttribute(
                    "user"
                ) == null) {

                response.sendRedirect(
                    "login"
                );

                return;
            }

            UserModel user =
                (UserModel)
                    session.getAttribute(
                        "user"
                    );

            int assignmentId =
                Integer.parseInt(
                    assignmentIdParam
                );

            // LOAD ASSIGNMENT
            AssignmentModel assignment =
                assignmentService
                    .getAssignmentById(
                        assignmentId
                    );

            // LOAD SUBMISSIONS
            List<SubmissionModel>
                submissions =

                submissionService
                    .getSubmissionsByStudentAndAssignment(
                        user.getId(),
                        assignmentId
                    );

            // ATTACH FILES
            for (SubmissionModel
                    submission
                    : submissions) {

                submission
                    .setSubmissionFiles(

                        submissionFileService
                            .getFilesBySubmissionId(
                                submission.getId()
                            )
                    );
            }

            request.setAttribute(
                "assignment",
                assignment
            );

            request.setAttribute(
                "submissions",
                submissions
            );

            request.setAttribute(
                "activePage",
                "submissions"
            );

            request.getRequestDispatcher(
                "/WEB-INF/pages/layout.jsp?contentPage=submission-content.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "assignments"
            );
        }
    }
}
