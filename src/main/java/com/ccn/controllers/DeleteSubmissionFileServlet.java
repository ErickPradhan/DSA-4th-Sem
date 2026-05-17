package com.ccn.controllers;

import java.io.File;
import java.io.IOException;

import com.ccn.model.SubmissionFileModel;
import com.ccn.service.SubmissionFileService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-submission-file")
public class DeleteSubmissionFileServlet
        extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SubmissionFileService
        submissionFileService =
            new SubmissionFileService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int fileId =
                Integer.parseInt(
                    request.getParameter(
                        "file_id"
                    )
                );

            int assignmentId =
                Integer.parseInt(
                    request.getParameter(
                        "assignment_id"
                    )
                );

            SubmissionFileModel file =
                submissionFileService
                    .getFileById(fileId);

            if (file != null) {

                // DELETE PHYSICAL FILE
                String uploadPath =
                    getServletContext()
                        .getRealPath("")
                    + File.separator
                    + "uploads"
                    + File.separator
                    + file.getFileName();

                File physicalFile =
                    new File(uploadPath);

                if (physicalFile.exists()) {

                    physicalFile.delete();
                }

                // DELETE DB RECORD
                submissionFileService
                    .deleteSubmissionFile(
                        fileId
                    );
            }

            request.getSession()
                .setAttribute(
                    "successMessage",
                    "File deleted successfully!"
                );

            response.sendRedirect(
                "submission?assignment_id="
                + assignmentId
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "submissions"
            );
        }
    }
}