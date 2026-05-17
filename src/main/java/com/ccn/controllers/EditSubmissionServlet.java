package com.ccn.controllers;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import com.ccn.model.SubmissionFileModel;
import com.ccn.model.SubmissionModel;
import com.ccn.service.SubmissionFileService;
import com.ccn.service.SubmissionService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/edit-submission")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class EditSubmissionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SubmissionService submissionService =
        new SubmissionService();

    private SubmissionFileService submissionFileService =
        new SubmissionFileService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int submissionId =
                Integer.parseInt(
                    request.getParameter(
                        "submission_id"
                    )
                );

            SubmissionModel submission =
                submissionService
                    .getSubmissionById(
                        submissionId
                    );

            if (submission == null) {

                response.sendRedirect(
                    "submissions"
                );

                return;
            }

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

            boolean uploaded = false;

            for (Part part : parts) {

                if ("updated_file[]".equals(
                        part.getName())
                    &&
                    part.getSize() > 0) {

                    uploaded = true;

                    String fileName =
                        part.getSubmittedFileName();

                    // SAVE FILE
                    part.write(
                        uploadPath
                        + File.separator
                        + fileName
                    );

                    // SAVE TO DB
                    SubmissionFileModel file =
                        new SubmissionFileModel();

                    file.setSubmissionId(
                        submissionId
                    );

                    file.setFileName(
                        fileName
                    );

                    submissionFileService
                        .addSubmissionFile(
                            file
                        );
                }
            }

            if (uploaded) {

                request.getSession()
                    .setAttribute(
                        "successMessage",
                        "Files added successfully!"
                    );
            }

            response.sendRedirect(
                "submission?assignment_id="
                + submission.getAssignmentId()
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "submissions"
            );
        }
    }
}