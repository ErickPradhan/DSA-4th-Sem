package com.ccn.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.ccn.model.UserModel;
import com.ccn.service.UserService;
import com.ccn.util.PasswordUtil;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Show registration page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session = request.getSession(false);

    	if (session != null && session.getAttribute("user") != null) {

    	    UserModel user = (UserModel) session.getAttribute("user");

    	    if ("admin".equals(user.getRole())) {

    	        response.sendRedirect(
    	            request.getContextPath() + "/admin-dashboard"
    	        );

    	    } else {

    	        response.sendRedirect(
    	            request.getContextPath() + "/student-dashboard"
    	        );
    	    }

    	    return;
    	}

        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    // Handle registration form submission
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String firstName = request.getParameter("firstName");

    	String lastName = request.getParameter("lastName");

    	String name = firstName + " " + lastName;
    	String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {

            request.setAttribute("error", "Passwords do not match");

            request.getRequestDispatcher("/WEB-INF/pages/register.jsp")
                   .forward(request, response);

            return;
        }
        
        UserService userService = new UserService();

        if (userService.isEmailExists(email)) {

            request.setAttribute(
                "error",
                "An account with this email already exists."
            );

            request.getRequestDispatcher("/WEB-INF/pages/register.jsp")
                   .forward(request, response);

            return;
            
        } else {

            UserModel user = new UserModel();

            user.setName(name);
            user.setEmail(email);
            
            String hashedPassword = PasswordUtil.hashPassword(password);
            System.out.println("Entered Password: " + password);
            System.out.println("Generated Hash: " + hashedPassword);
            user.setPassword(hashedPassword);
            
            String role = request.getParameter("role");

            String adminKey =
                request.getParameter("adminKey");

            if ("admin".equals(role)) {

                if (!"ADMIN-2026".equals(adminKey)) {

                    request.setAttribute(
                        "error",
                        "Invalid admin access key."
                    );

                    request.getRequestDispatcher(
                        "/WEB-INF/pages/register.jsp"
                    ).forward(request, response);

                    return;
                }
            }

            user.setRole(role);

            boolean result = userService.registerUser(user);

            if (result) {

                request.setAttribute(
                    "registrationSuccess",
                    true
                );

                request.getRequestDispatcher(
                    "/WEB-INF/pages/register.jsp"
                ).forward(request, response);

            } else {

                request.setAttribute(
                    "error",
                    "Registration failed."
                );

                request.getRequestDispatcher(
                    "/WEB-INF/pages/register.jsp"
                ).forward(request, response);
            }
        }
    }
}