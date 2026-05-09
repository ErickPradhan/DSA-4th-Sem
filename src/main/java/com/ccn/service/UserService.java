package com.ccn.service;

import java.sql.Connection; //
import java.sql.PreparedStatement; //
import java.sql.ResultSet; //

import com.ccn.config.DBConfig; // Connects to DBConfig
import com.ccn.model.UserModel; // Connects to UserModel.java

public class UserService {
	
	//Register User
	public boolean registerUser(UserModel user) {
		boolean result = false;
		
		try {
			Connection conn = DBConfig.getDbConnection();
			
			String sql = "INSERT INTO users(name,email,password,role,created_at) VALUES(?,?,?,?,NOW())";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getRole());
			
			int rows = ps.executeUpdate();
			
			if (rows > 0) {
				result = true;
			}
			
			ps.close();
			conn.close();
		} 
		catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return result;
	}
	
	//Check if email already exists
	public boolean isEmailExists(String email) {
		
		boolean exists = false;
		
		try {
			
			Connection conn = DBConfig.getDbConnection();
			
			String sql = "SELECT * FROM users WHERE email=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				exists = true;
			}
			
			rs.close();
			ps.close();
			conn.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return exists;
	}
	
	// Login User:
	public UserModel loginUser(String email, String password) {
		
		UserModel user = null;
		
		try {
			
			Connection conn = DBConfig.getDbConnection();
			
			String sql = "SELECT * FROM users WHERE email=? AND password=?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, email);
			ps.setString(2, password);
			
			System.out.println("LOGIN EMAIL: " + email);
			System.out.println("LOGIN HASH: " + password);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {

			    user = new UserModel();

			    user.setId(rs.getInt("id"));

			    user.setName(rs.getString("name"));

			    user.setEmail(rs.getString("email"));

			    user.setRole(rs.getString("role"));
			}
			
			rs.close();
			ps.close();
			conn.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public int getTotalStudents() {
	    int count = 0;

	    String query = "SELECT COUNT(*) FROM users WHERE role = 'student'";

	    try (Connection conn = DBConfig.getDbConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {

	        if (rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
}
