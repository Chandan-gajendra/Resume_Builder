package com.studentportal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class SignupServlet
 */
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        try {
	            Class.forName("org.postgresql.Driver");
	            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/student_portal", "postgres", "1234");
	            PreparedStatement ps = conn.prepareStatement("INSERT INTO students (name, email, password) VALUES (?, ?, ?)");
	            ps.setString(1, name);
	            ps.setString(2, email);
	            ps.setString(3, password);
	            ps.executeUpdate();
	            conn.close();
	            response.sendRedirect("login.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	            
	        }
	    }
	}