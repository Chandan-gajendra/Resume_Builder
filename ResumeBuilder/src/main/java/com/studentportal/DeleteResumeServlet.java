package com.studentportal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class DeleteResumeServlet
 */
public class DeleteResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	        String email = (String) session.getAttribute("email");
	        if(email == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        String id = request.getParameter("id");

	        try {
	            Class.forName("org.postgresql.Driver");
	            Connection conn = DriverManager.getConnection(
	                "jdbc:postgresql://localhost:5432/student_portal",
	                "postgres", "1234");

	            PreparedStatement ps = conn.prepareStatement(
	                "DELETE FROM resumes WHERE id=? AND email=?");
	            ps.setInt(1, Integer.parseInt(id));
	            ps.setString(2, email);

	            ps.executeUpdate();

	            conn.close();

	            response.sendRedirect("viewResume.jsp");

	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	    }
	}