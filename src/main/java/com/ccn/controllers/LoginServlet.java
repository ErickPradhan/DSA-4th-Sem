package com.ccn.controllers;

import java.io.IOException;

import com.ccn.model.UserModel;
import com.ccn.service.UserService;
import com.ccn.util.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserService userService = new UserService();
    
    
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

        request.getRequestDispatcher("/WEB-INF/pages/login.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String email = request.getParameter("email");
    	String password = request.getParameter("password");

    	String hashedPassword = PasswordUtil.hashPassword(password);

    	System.out.println("Generated Hash: " + hashedPassword);

    	UserModel user = userService.loginUser(email, hashedPassword);
    	
    	if (user == null) {

    	    request.setAttribute("error", "Invalid email or password");

    	    request.getRequestDispatcher("/WEB-INF/pages/login.jsp")
    	           .forward(request, response);

    	    return;
    	}

    	HttpSession session = request.getSession();

    	session.setAttribute("user", user);

    	if ("admin".equals(user.getRole())) {

    	    request.setAttribute("loginSuccess", true);

    	    request.setAttribute(
    	        "redirectUrl",
    	        request.getContextPath() + "/admin-dashboard"
    	    );

    	} else {

    	    request.setAttribute("loginSuccess", true);

    	    request.setAttribute(
    	        "redirectUrl",
    	        request.getContextPath() + "/student-dashboard"
    	    );
    	}

    	request.getRequestDispatcher("/WEB-INF/pages/login.jsp")
    	       .forward(request, response);
    }

}