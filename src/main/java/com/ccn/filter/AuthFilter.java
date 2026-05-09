package com.ccn.filter;

import java.io.IOException;

import com.ccn.model.UserModel;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {
    "/admin-dashboard",
    "/student-dashboard",
    "/courses",
    "/add-course",
    "/assignments",
    "/add-assignment",
    "/submission",
    "/submit-assignment",
    "/submissions"
})
public class AuthFilter extends HttpFilter implements Filter {

    private static final long serialVersionUID = 1L;

    public AuthFilter() {
        super();
    }

    public void init(FilterConfig fConfig)
            throws ServletException {
    }

    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req =
            (HttpServletRequest) request;

        HttpServletResponse res =
            (HttpServletResponse) response;

        HttpSession session =
            req.getSession(false);

        boolean loggedIn =
            session != null &&
            session.getAttribute("user") != null;

        // NOT LOGGED IN
        if (!loggedIn) {

            res.sendRedirect(
                req.getContextPath() + "/login"
            );

            return;
        }

        UserModel user =
            (UserModel) session.getAttribute("user");

        String role =
            user.getRole();

        String path =
            req.getServletPath();

        // ADMIN ONLY PAGES
        boolean adminPage =
            path.equals("/admin-dashboard") ||
            path.equals("/add-course") ||
            path.equals("/add-assignment") ||
            path.equals("/submissions");

        // BLOCK STUDENTS FROM ADMIN PAGES
        if (adminPage &&
            !"admin".equals(role)) {

            res.sendRedirect(
                req.getContextPath() + "/student-dashboard"
            );

            return;
        }

        // BLOCK ADMIN FROM STUDENT DASHBOARD
        if (path.equals("/student-dashboard") &&
            "admin".equals(role)) {

            res.sendRedirect(
                req.getContextPath() + "/admin-dashboard"
            );

            return;
        }

        chain.doFilter(request, response);
    }

    public void destroy() {
    }
}