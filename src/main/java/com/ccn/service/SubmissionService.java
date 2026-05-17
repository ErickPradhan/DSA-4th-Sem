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
            	    "INSERT INTO submissions(student_id, assignment_id, file_path, submission_date, status) VALUES (?, ?, ?, NOW(), ?)";
            
            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, submission.getStudentId());
            ps.setInt(2, submission.getAssignmentId());
            ps.setString(3, submission.getFilePath());
            ps.setString(4, "Submitted");
            
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
                "s.submission_date, " +
                "s.status " +
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
                
                submission.setStatus(
                	    rs.getString("status")
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
    
    public List<SubmissionModel> getSubmissionsByStudentId(int studentId) {

        List<SubmissionModel> submissions =
            new ArrayList<>();

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT s.id, " +
                "s.student_id, " +
                "s.assignment_id, " +
                "s.file_path, " +
                "s.submission_date, " +
                "s.status, " +
                "a.title AS assignment_title, " +
                "c.title AS course_title " +
                "FROM submissions s " +
                "INNER JOIN assignments a " +
                "ON s.assignment_id = a.id " +
                "INNER JOIN courses c " +
                "ON a.course_id = c.id " +
                "WHERE s.student_id = ? " +
                "ORDER BY s.submission_date DESC " +
                "LIMIT 5";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                SubmissionModel submission =
                    new SubmissionModel();

                submission.setId(
                    rs.getInt("id")
                );

                submission.setStudentId(
                    rs.getInt("student_id")
                );

                submission.setAssignmentId(
                    rs.getInt("assignment_id")
                );

                submission.setFilePath(
                    rs.getString("file_path")
                );

                submission.setSubmissionDate(
                    rs.getString("submission_date")
                );

                submission.setStatus(
                    rs.getString("status")
                );

                submission.setAssignmentTitle(
                    rs.getString("assignment_title")
                );

                submission.setCourseTitle(
                    rs.getString("course_title")
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
    
    // Get Submission By ID
    public SubmissionModel getSubmissionById(int id) {

        SubmissionModel submission =
            null;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT * FROM submissions " +
                "WHERE id = ?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs =
                ps.executeQuery();

            if (rs.next()) {

                submission =
                    new SubmissionModel();

                submission.setId(
                    rs.getInt("id")
                );

                submission.setStudentId(
                    rs.getInt("student_id")
                );

                submission.setAssignmentId(
                    rs.getInt("assignment_id")
                );

                submission.setFilePath(
                    rs.getString("file_path")
                );

                submission.setSubmissionDate(
                    rs.getString("submission_date")
                );

                submission.setStatus(
                    rs.getString("status")
                );
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return submission;
    }
    
    // GET LATEST SUBMISSION
    public SubmissionModel getLatestSubmission(
            int studentId,
            int assignmentId) {

        SubmissionModel submission =
            null;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT * FROM submissions " +
                "WHERE student_id = ? " +
                "AND assignment_id = ? " +
                "ORDER BY id DESC LIMIT 1";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, studentId);
            
            ResultSet rs =
            	    ps.executeQuery();

            ps.setInt(2, assignmentId);

            

            if (rs.next()) {

                submission =
                    new SubmissionModel();

                submission.setId(
                    rs.getInt("id")
                );

                submission.setStudentId(
                    rs.getInt("student_id")
                );

                submission.setAssignmentId(
                    rs.getInt("assignment_id")
                );

                submission.setFilePath(
                    rs.getString("file_path")
                );

                submission.setSubmissionDate(
                    rs.getString("submission_date")
                );

                submission.setStatus(
                    rs.getString("status")
                );
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return submission;
    }
    
    // GET SUBMISSIONS BY STUDENT & ASSIGNMENT
    public List<SubmissionModel>
        getSubmissionsByStudentAndAssignment(
            int studentId,
            int assignmentId) {

        List<SubmissionModel> list =
            new ArrayList<>();

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT s.*, a.title AS assignment_title " +
                "FROM submissions s " +
                "JOIN assignments a " +
                "ON s.assignment_id = a.id " +
                "WHERE s.student_id = ? " +
                "AND s.assignment_id = ? " +
                "ORDER BY s.id DESC";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, studentId);

            ps.setInt(2, assignmentId);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                SubmissionModel submission =
                    new SubmissionModel();

                submission.setId(
                    rs.getInt("id")
                );

                submission.setStudentId(
                    rs.getInt("student_id")
                );

                submission.setAssignmentId(
                    rs.getInt("assignment_id")
                );

                submission.setFilePath(
                    rs.getString("file_path")
                );

                submission.setSubmissionDate(
                    rs.getString(
                        "submission_date"
                    )
                );

                submission.setStatus(
                    rs.getString("status")
                );

                submission.setAssignmentTitle(
                    rs.getString(
                        "assignment_title"
                    )
                );

                list.add(submission);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }
    
    // Update Submission
    public boolean updateSubmission(
            SubmissionModel submission) {

        boolean result = false;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "UPDATE submissions " +
                "SET file_path = ? " +
                "WHERE id = ?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setString(
                1,
                submission.getFilePath()
            );

            ps.setInt(
                2,
                submission.getId()
            );

            int rows =
                ps.executeUpdate();

            result = rows > 0;

            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return result;
    }
    
    // Delete Submission
    public boolean deleteSubmission(int id) {

        boolean result = false;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "DELETE FROM submissions " +
                "WHERE id = ?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, id);

            int rows =
                ps.executeUpdate();

            result = rows > 0;

            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return result;
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
                
                submission.setStatus(
                	    rs.getString("status")
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