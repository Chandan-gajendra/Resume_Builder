<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>View My Resume</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container mt-4">
<h2>My Saved Resume(s)</h2>

<%
String email = (String) session.getAttribute("email");
if(email == null) {
    response.sendRedirect("login.jsp");
    return;
}

try {
    Class.forName("org.postgresql.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/student_portal",
        "postgres", "1234");

    PreparedStatement ps = conn.prepareStatement(
        "SELECT * FROM resumes WHERE email=? ORDER BY created_at DESC");
    ps.setString(1, email);
    ResultSet rs = ps.executeQuery();

    boolean found = false;
    while(rs.next()) {
        found = true;
%>

<div class="card mb-3 p-3">
  <h4><%=rs.getString("name")%></h4>
  <p><strong>Email:</strong> <%=rs.getString("email")%></p>
  <p><strong>Phone:</strong> <%=rs.getString("phone")%></p>
  <p><strong>Education:</strong> <%=rs.getString("education")%></p>
  <p><strong>Experience:</strong> <%=rs.getString("experience")%></p>
  <p><strong>Skills:</strong> <%=rs.getString("skills")%></p>
  <p><strong>Projects:</strong> <%=rs.getString("projects")%></p>

  <a href="editResume.jsp?id=<%=rs.getInt("id")%>" class="btn btn-primary btn-sm">Edit</a>
  <a href="DeleteResumeServlet?id=<%=rs.getInt("id")%>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
</div>

<%
    }
    if(!found) {
%>
<p>No resumes found. <a href="resumeBuilder.jsp">Build one now!</a></p>
<%
    }

    rs.close();
    ps.close();
    conn.close();
} catch(Exception e) {
    e.printStackTrace();
}
%>

</div>
</body>
</html>