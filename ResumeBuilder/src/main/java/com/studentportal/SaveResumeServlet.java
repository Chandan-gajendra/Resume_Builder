package com.studentportal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class SaveResumeServlet
 */
public class SaveResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get logged-in user's email from session
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        if (email == null) {
            // Not logged in → redirect to login
            response.sendRedirect("login.jsp");
            return;
        }

        // Read form data
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String education = request.getParameter("education");
        String experience = request.getParameter("experience");
        String skills = request.getParameter("skills");
        String projects = request.getParameter("projects");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Connect to DB
            conn = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/student_portal", // change DB name if needed
                "postgres",                                        // DB username
                "1234"                                     // DB password
            );

            String sql = "INSERT INTO resumes (email, name, phone, education, experience, skills, projects) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?)";

            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, name);
            ps.setString(3, phone);
            ps.setString(4, education);
            ps.setString(5, experience);
            ps.setString(6, skills);
            ps.setString(7, projects);

            int rows = ps.executeUpdate();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            if (rows > 0) {
                out.println("<script>alert('Resume saved successfully!'); window.location='dashboard.jsp';</script>");
            } else {
                out.println("<script>alert('Failed to save resume. Try again.'); window.location='resumeBuilder.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='resumeBuilder.jsp';</script>");
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}