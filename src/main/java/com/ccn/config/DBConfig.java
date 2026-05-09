package com.ccn.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DBConfig handles the connection to the MySQL database.
 */
public class DBConfig {

    // Database configuration
    private static final String DB_NAME = "ccn_db";
    private static final String URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    public static Connection getDbConnection()
            throws SQLException, ClassNotFoundException {

        // Load MySQL Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Create connection
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}