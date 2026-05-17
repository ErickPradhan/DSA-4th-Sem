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
            	    "INSERT INTO courses(title, description, category, instructor, status, created_at) VALUES(?, ?, ?, ?, ?, NOW())";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setString(1, course.getTitle());
            ps.setString(2, course.getDescription());
            ps.setString(3, course.getCategory());
            ps.setString(4, course.getInstructor());
            ps.setString(5, course.getStatus());
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
                course.setCategory(rs.getString("category"));
                course.setInstructor(rs.getString("instructor"));
                course.setStatus(rs.getString("status"));

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
                course.setCategory(rs.getString("category"));
                course.setInstructor(rs.getString("instructor"));
                course.setStatus(rs.getString("status"));
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
    
    // Update Course
    public boolean updateCourse(CourseModel course) {

        boolean result = false;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "UPDATE courses " +
                "SET title = ?, " +
                "category = ?, " +
                "instructor = ?, " +
                "status = ? " +
                "WHERE id = ?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setString(1, course.getTitle());
            ps.setString(2, course.getCategory());
            ps.setString(3, course.getInstructor());
            ps.setString(4, course.getStatus());
            ps.setInt(5, course.getId());

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
    
    // Delete Course
    public boolean deleteCourse(int id) {

        boolean result = false;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "DELETE FROM courses WHERE id = ?";

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
    
}