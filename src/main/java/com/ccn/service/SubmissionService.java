package com.ccn.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ccn.config.DBConfig;
import com.ccn.model.SubmissionModel;

public class SubmissionService {

    // Add submission
    public boolean addSubmission(SubmissionModel submission) {

        boolean result = false;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "INSERT INTO submissions(student_id, assignment_id, file_path, submission_date) VALUES (?, ?, ?, NOW())";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, submission.getStudentId());
            ps.setInt(2, submission.getAssignmentId());
            ps.setString(3, submission.getFilePath());

            int rows =
                ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }

            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    // Get all submissions
    public List<SubmissionModel> getAllSubmissions() {

        List<SubmissionModel> submissions =
            new ArrayList<>();

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT s.id, " +
                "u.name AS student_name, " +
                "c.title AS course_title, " +
                "a.title AS assignment_title, " +
                "s.file_path, " +
                "s.submission_date " +
                "FROM submissions s " +
                "JOIN users u ON s.student_id = u.id " +
                "JOIN assignments a ON s.assignment_id = a.id " +
                "JOIN courses c ON a.course_id = c.id " +
                "ORDER BY s.submission_date DESC";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                SubmissionModel submission =
                    new SubmissionModel();

                submission.setId(
                    rs.getInt("id")
                );

                submission.setStudentName(
                    rs.getString("student_name")
                );

                submission.setCourseTitle(
                    rs.getString("course_title")
                );

                submission.setAssignmentTitle(
                    rs.getString("assignment_title")
                );

                submission.setFilePath(
                    rs.getString("file_path")
                );

                submission.setSubmissionDate(
                    rs.getString("submission_date")
                );

                submissions.add(submission);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return submissions;
    }

    // Total submissions
    public int getTotalSubmissions() {

        int count = 0;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT COUNT(*) FROM submissions";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    // Recent submissions
    public List<SubmissionModel> getRecentSubmissions() {

        List<SubmissionModel> submissions =
            new ArrayList<>();

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT s.*, " +
                "u.name, " +
                "a.title AS assignment_title, " +
                "c.title AS course_title " +
                "FROM submissions s " +
                "JOIN users u ON s.student_id = u.id " +
                "JOIN assignments a ON s.assignment_id = a.id " +
                "JOIN courses c ON a.course_id = c.id " +
                "ORDER BY s.submission_date DESC LIMIT 5";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                SubmissionModel submission =
                    new SubmissionModel();

                submission.setId(
                    rs.getInt("id")
                );

                submission.setStudentName(
                		rs.getString("name")
                );

                submission.setAssignmentTitle(
                    rs.getString("assignment_title")
                );

                submission.setCourseTitle(
                    rs.getString("course_title")
                );

                submission.setSubmissionDate(
                    rs.getString("submission_date")
                );

                submissions.add(submission);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return submissions;
    }
}