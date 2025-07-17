<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/bg.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp" />

<%
    String userEmail = (String) session.getAttribute("email");

    if (userEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String name = "";
    String email = "";

    try {
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/student_portal", "postgres", "1234");

        PreparedStatement ps = conn.prepareStatement("SELECT name, email FROM students WHERE email = ?");
        ps.setString(1, userEmail);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
        }

        conn.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<div class="container mt-5">
  <h2>Your Profile</h2>
  <p><strong>Name:</strong> <%= name %></p>
  <p><strong>Email:</strong> <%= email %></p>
</div>

</body>
</html>