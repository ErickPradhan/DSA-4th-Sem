package com.ccn.controllers;

import java.io.File;
import java.io.IOException;

import com.ccn.model.SubmissionModel;
import com.ccn.model.UserModel;
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
@MultipartConfig
public class SubmitAssignmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SubmissionService submissionService =
        new SubmissionService();


    @Override
    protected void doPost(HttpServletRequest request,
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
    		    (UserModel) session.getAttribute("user");
        
        

        int studentId =
            user.getId();

        int assignmentId =
            Integer.parseInt(
                request.getParameter("assignmentId")
            );

        Part filePart =
            request.getPart("file");

        String fileName =
            filePart.getSubmittedFileName();

        String uploadPath =
            getServletContext().getRealPath("")
            + File.separator
            + "uploads";

        File uploadDir =
            new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        filePart.write(
            uploadPath
            + File.separator
            + fileName
        );

        SubmissionModel submission =
            new SubmissionModel();

        submission.setStudentId(studentId);
        submission.setAssignmentId(assignmentId);
        submission.setFilePath(fileName);

        boolean result =
            submissionService.addSubmission(submission);

        if (result) {

            request.getSession().setAttribute(
                "successMessage",
                "Assignment submitted successfully!"
            );

            response.sendRedirect("student-dashboard");

        } else {

            request.getSession().setAttribute(
                "errorMessage",
                "Submission failed!"
            );

            response.sendRedirect(
                "submission?assignmentId=" + assignmentId
            );
        }

    }

}