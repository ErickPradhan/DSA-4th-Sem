package com.ccn.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ccn.config.DBConfig;
import com.ccn.model.CourseModel;

public class CourseService {

    // Add new course
    public boolean addCourse(CourseModel course) {

        boolean result = false;

        try {

            Connection conn = DBConfig.getDbConnection();

            String sql =
                "INSERT INTO courses(title, description, created_at) VALUES(?, ?, NOW())";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setString(1, course.getTitle());
            ps.setString(2, course.getDescription());

            int rows = ps.executeUpdate();

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

    // Get all courses
    public List<CourseModel> getAllCourses() {

        List<CourseModel> courses =
            new ArrayList<>();

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT * FROM courses";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                CourseModel course =
                    new CourseModel();

                course.setId(rs.getInt("id"));
                course.setTitle(rs.getString("title"));
                course.setDescription(rs.getString("description"));

                courses.add(course);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return courses;
    }

    // Get course by ID
    public CourseModel getCourseById(int id) {

        CourseModel course = null;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT * FROM courses WHERE id = ?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs =
                ps.executeQuery();

            if (rs.next()) {

                course =
                    new CourseModel();

                course.setId(rs.getInt("id"));
                course.setTitle(rs.getString("title"));
                course.setDescription(rs.getString("description"));
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return course;
    }

    // Total courses
    public int getTotalCourses() {

        int total = 0;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT COUNT(*) FROM courses";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            if (rs.next()) {
                total = rs.getInt(1);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }
}