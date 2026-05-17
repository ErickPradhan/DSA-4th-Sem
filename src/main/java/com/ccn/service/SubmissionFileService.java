package com.ccn.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ccn.config.DBConfig;
import com.ccn.model.SubmissionFileModel;

public class SubmissionFileService {

    // ADD FILE
    public boolean addSubmissionFile(
            SubmissionFileModel file) {

        boolean result = false;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "INSERT INTO submission_files " +
                "(submission_id, file_name) " +
                "VALUES (?, ?)";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(
                1,
                file.getSubmissionId()
            );

            ps.setString(
                2,
                file.getFileName()
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

    // GET FILES BY SUBMISSION
    public List<SubmissionFileModel>
        getFilesBySubmissionId(
            int submissionId) {

        List<SubmissionFileModel> list =
            new ArrayList<>();

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT * FROM submission_files " +
                "WHERE submission_id = ?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, submissionId);

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                SubmissionFileModel file =
                    new SubmissionFileModel();

                file.setId(
                    rs.getInt("id")
                );

                file.setSubmissionId(
                    rs.getInt("submission_id")
                );

                file.setFileName(
                    rs.getString("file_name")
                );

                file.setUploadedAt(
                    rs.getString("uploaded_at")
                );

                list.add(file);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }
    
    // GET FILE BY ID
    public SubmissionFileModel
        getFileById(int id) {

        SubmissionFileModel file =
            null;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "SELECT * FROM submission_files " +
                "WHERE id = ?";

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs =
                ps.executeQuery();

            if (rs.next()) {

                file =
                    new SubmissionFileModel();

                file.setId(
                    rs.getInt("id")
                );

                file.setSubmissionId(
                    rs.getInt(
                        "submission_id"
                    )
                );

                file.setFileName(
                    rs.getString(
                        "file_name"
                    )
                );

                file.setUploadedAt(
                    rs.getString(
                        "uploaded_at"
                    )
                );
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return file;
    }

    // DELETE FILE
    public boolean deleteSubmissionFile(
            int id) {

        boolean result = false;

        try {

            Connection conn =
                DBConfig.getDbConnection();

            String sql =
                "DELETE FROM submission_files " +
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
}