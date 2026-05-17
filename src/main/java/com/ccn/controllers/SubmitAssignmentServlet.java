package com.ccn.controllers;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import com.ccn.model.SubmissionFileModel;
import com.ccn.model.SubmissionModel;
import com.ccn.model.UserModel;
import com.ccn.service.SubmissionFileService;
import com.ccn.service.SubmissionService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/submit-assignment")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class SubmitAssignmentServlet
        extends HttpServlet {

    private static final long
        serialVersionUID = 1L;

    private SubmissionService
        submissionService =
            new SubmissionService();

    private SubmissionFileService
        submissionFileService =
            new SubmissionFileService();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
            request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect("login");
            return;
        }

        UserModel user =
            (UserModel)
                session.getAttribute("user");

        int studentId =
            user.getId();

        int assignmentId =
            Integer.parseInt(
                request.getParameter(
                    "assignment_id"
                )
            );

        // UPLOAD DIRECTORY
        String uploadPath =
            getServletContext().getRealPath("")
            + File.separator
            + "uploads";

        File uploadDir =
            new File(uploadPath);

        if (!uploadDir.exists()) {

            uploadDir.mkdir();
        }

        // GET FILES
        Collection<Part> parts =
            request.getParts();

        boolean hasFile = false;

        // VALIDATE FILES
        for (Part part : parts) {

            if ("submission_file".equals(
                    part.getName())
                &&
                part.getSize() > 0) {

                hasFile = true;
                break;
            }
        }

        // NO FILE SELECTED
        if (!hasFile) {

            session.setAttribute(
                "errorMessage",
                "Please select at least one file!"
            );

            response.sendRedirect(
                "submission?assignment_id="
                + assignmentId
            );

            return;
        }

        // CREATE SUBMISSION
        SubmissionModel submission =
            new SubmissionModel();

        submission.setStudentId(
            studentId
        );

        submission.setAssignmentId(
            assignmentId
        );

        boolean result =
            submissionService.addSubmission(
                submission
            );

        if (!result) {

            session.setAttribute(
                "errorMessage",
                "Submission failed!"
            );

            response.sendRedirect(
                "submission?assignment_id="
                + assignmentId
            );

            return;
        }

        // GET LATEST SUBMISSION
        SubmissionModel latestSubmission =
            submissionService
                .getLatestSubmission(
                    studentId,
                    assignmentId
                );

        if (latestSubmission == null) {

            session.setAttribute(
                "errorMessage",
                "Submission failed!"
            );

            response.sendRedirect(
                "submission?assignment_id="
                + assignmentId
            );

            return;
        }

        // PROCESS FILES
        for (Part part : parts) {

            if ("submission_file".equals(
                    part.getName())
                &&
                part.getSize() > 0) {

                String fileName =
                    new File(
                        part.getSubmittedFileName()
                    ).getName();

                if (fileName == null ||
                    fileName.trim().isEmpty()) {

                    continue;
                }

                // SAVE PHYSICAL FILE
                part.write(
                    uploadPath
                    + File.separator
                    + fileName
                );

                // SAVE FILE INFO
                SubmissionFileModel file =
                    new SubmissionFileModel();

                file.setSubmissionId(
                    latestSubmission.getId()
                );

                file.setFileName(
                    fileName
                );

                submissionFileService
                    .addSubmissionFile(file);
            }
        }

        session.setAttribute(
            "successMessage",
            "Assignment submitted successfully!"
        );

        response.sendRedirect(
        	    "submission?assignment_id="
        	    + assignmentId
        	);
    }
}