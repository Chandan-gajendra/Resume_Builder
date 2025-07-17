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
 * Servlet implementation class EditResumeServlet
 */
public class EditResumeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
	        String email = (String) session.getAttribute("email");
	        if(email == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        String id = request.getParameter("id");
	        String name = request.getParameter("name");
	        String phone = request.getParameter("phone");
	        String education = request.getParameter("education");
	        String experience = request.getParameter("experience");
	        String skills = request.getParameter("skills");
	        String projects = request.getParameter("projects");

	        try {
	            Class.forName("org.postgresql.Driver");
	            Connection conn = DriverManager.getConnection(
	                "jdbc:postgresql://localhost:5432/student_portal",
	                "postgres", "1234");

	            PreparedStatement ps = conn.prepareStatement(
	                "UPDATE resumes SET name=?, phone=?, education=?, experience=?, skills=?, projects=? WHERE id=? AND email=?");
	            ps.setString(1, name);
	            ps.setString(2, phone);
	            ps.setString(3, education);
	            ps.setString(4, experience);
	            ps.setString(5, skills);
	            ps.setString(6, projects);
	            ps.setInt(7, Integer.parseInt(id));
	            ps.setString(8, email);

	            ps.executeUpdate();

	            conn.close();

	            response.sendRedirect("viewResume.jsp");

	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	    }
	}