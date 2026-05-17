package com.ccn.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import com.ccn.model.SubmissionModel;
import com.ccn.service.SubmissionService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/download-submission")
public class DownloadSubmissionServlet extends HttpServlet {

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

            SubmissionModel submission =
                submissionService.getSubmissionById(
                    submissionId
                );

            if (submission == null) {

                response.sendRedirect("submissions");
                return;
            }

            String fileName =
                submission.getFilePath();

            String filePath =
                getServletContext().getRealPath("")
                + File.separator
                + "uploads"
                + File.separator
                + fileName;

            File file =
                new File(filePath);

            if (!file.exists()) {

                response.getWriter().println(
                    "File not found!"
                );

                return;
            }

            response.setContentType(
                "application/octet-stream"
            );

            response.setHeader(
                "Content-Disposition",
                "attachment; filename=\""
                + file.getName()
                + "\""
            );

            FileInputStream fis =
                new FileInputStream(file);

            OutputStream os =
                response.getOutputStream();

            byte[] buffer =
                new byte[4096];

            int bytesRead;

            while ((bytesRead = fis.read(buffer))
                    != -1) {

                os.write(
                    buffer,
                    0,
                    bytesRead
                );
            }

            fis.close();
            os.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("submissions");
        }
    }
}