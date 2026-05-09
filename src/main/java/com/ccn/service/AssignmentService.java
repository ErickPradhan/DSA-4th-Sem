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
                "INSERT INTO assignments(course_id, title, description, deadline) VALUES (?, ?, ?, ?)";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, assignment.getCourseId());
            ps.setString(2, assignment.getTitle());
            ps.setString(3, assignment.getDescription());
            ps.setString(4, assignment.getDeadline());

            int rows = ps.executeUpdate();

            result = rows > 0;

            ps.close();
            conn.close();

        } catch (Exception e) {
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
                "JOIN courses ON assignments.course_id = courses.id";

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
                a.setCourseTitle(
                    rs.getString("course_title")
                );

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

}