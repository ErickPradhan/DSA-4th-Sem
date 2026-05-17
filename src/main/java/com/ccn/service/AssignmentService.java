package com.ccn.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ccn.config.DBConfig;
import com.ccn.model.AssignmentModel;

public class AssignmentService {

    // Add Assignment
    public boolean addAssignment(AssignmentModel assignment) {

        boolean result = false;

        try {

            Connection conn = DBConfig.getDbConnection();

            String sql =
            		"INSERT INTO assignments(course_id, title, description, deadline, status) VALUES (?, ?, ?, ?, ?)";
            
            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, assignment.getCourseId());
            ps.setString(2, assignment.getTitle());
            ps.setString(3, assignment.getDescription());
            ps.setString(4, assignment.getDeadline());
            ps.setString(5, assignment.getStatus());

            int rows = ps.executeUpdate();

            result = rows > 0;

            ps.close();
            conn.close();

        } catch (Exception e) {

            System.out.println("INSERT FAILED");

            e.printStackTrace();
        }

        return result;
    }

    // Total Assignments
    public int getTotalAssignments() {

        int count = 0;

        try {

            Connection conn = DBConfig.getDbConnection();

            String sql =
                "SELECT COUNT(*) FROM assignments";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

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

    // Get All Assignments
    public List<AssignmentModel> getAllAssignments() {

        List<AssignmentModel> list =
            new ArrayList<>();

        try {

            Connection conn = DBConfig.getDbConnection();

            String sql =
            	    "SELECT assignments.*, courses.title AS course_title " +
            	    "FROM assignments " +
            	    "JOIN courses ON assignments.course_id = courses.id " +
            	    "ORDER BY assignments.deadline ASC";
            
            PreparedStatement ps =
                conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                AssignmentModel a =
                    new AssignmentModel();

                a.setId(rs.getInt("id"));
                a.setCourseId(rs.getInt("course_id"));
                a.setTitle(rs.getString("title"));
                a.setDescription(rs.getString("description"));
                a.setDeadline(rs.getString("deadline"));
                a.setCourseTitle(rs.getString("course_title"));
                a.setStatus(rs.getString("status"));

                list.add(a);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
 // Get Assignments By Course ID
    public List<AssignmentModel> getAssignmentsByCourseId(int courseId) {

        List<AssignmentModel> list =
            new ArrayList<>();

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT assignments.*, " +
                "courses.title AS course_title " +
                "FROM assignments " +
                "JOIN courses " +
                "ON assignments.course_id = courses.id " +
                "WHERE assignments.course_id = ? " +
                "ORDER BY assignments.deadline ASC";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, courseId);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                AssignmentModel assignment =
                    new AssignmentModel();

                assignment.setId(
                    rs.getInt("id")
                );

                assignment.setCourseId(
                    rs.getInt("course_id")
                );

                assignment.setTitle(
                    rs.getString("title")
                );

                assignment.setDescription(
                    rs.getString("description")
                );

                assignment.setDeadline(
                    rs.getString("deadline")
                );

                assignment.setStatus(
                    rs.getString("status")
                );

                assignment.setCourseTitle(
                    rs.getString("course_title")
                );

                list.add(assignment);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // Update Assignment
    public boolean updateAssignment(AssignmentModel assignment) {

        boolean result = false;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "UPDATE assignments " +
                "SET title = ?, " +
                "deadline = ?, " +
                "status = ? " +
                "WHERE id = ?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setString(1, assignment.getTitle());
            ps.setString(2, assignment.getDeadline());
            ps.setString(3, assignment.getStatus());
            ps.setInt(4, assignment.getId());

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
    
    // Get Assignment By ID
    public AssignmentModel getAssignmentById(int id) {

        AssignmentModel assignment =
            null;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT assignments.*, " +
                "courses.title AS course_title " +
                "FROM assignments " +
                "JOIN courses " +
                "ON assignments.course_id = courses.id " +
                "WHERE assignments.id = ?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs =
                ps.executeQuery();

            if (rs.next()) {

                assignment =
                    new AssignmentModel();

                assignment.setId(
                    rs.getInt("id")
                );

                assignment.setCourseId(
                    rs.getInt("course_id")
                );

                assignment.setTitle(
                    rs.getString("title")
                );

                assignment.setDescription(
                    rs.getString("description")
                );

                assignment.setDeadline(
                    rs.getString("deadline")
                );

                assignment.setStatus(
                    rs.getString("status")
                );

                assignment.setCourseTitle(
                    rs.getString("course_title")
                );
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return assignment;
    }
    
    // Get recent assignments
    public List<AssignmentModel> getRecentAssignments() {

        List<AssignmentModel> assignments =
            new ArrayList<>();

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT * FROM assignments ORDER BY deadline ASC LIMIT 3";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                AssignmentModel assignment =
                    new AssignmentModel();

                assignment.setId(rs.getInt("id"));
                assignment.setTitle(rs.getString("title"));
                assignment.setDeadline(rs.getString("deadline"));

                assignments.add(assignment);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return assignments;
    }
    
}