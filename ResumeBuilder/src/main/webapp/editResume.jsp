<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit Resume</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container mt-4">
<h2>Edit Resume</h2>

<%
String email = (String) session.getAttribute("email");
if(email == null) {
    response.sendRedirect("login.jsp");
    return;
}

String id = request.getParameter("id");
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("org.postgresql.Driver");
    conn = DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/student_portal",
        "postgres", "1234");

    ps = conn.prepareStatement("SELECT * FROM resumes WHERE id=? AND email=?");
    ps.setInt(1, Integer.parseInt(id));
    ps.setString(2, email);
    rs = ps.executeQuery();

    if(rs.next()) {
%>

<form method="post" action="EditResumeServlet">
<input type="hidden" name="id" value="<%=rs.getInt("id")%>">

<div class="form-group">
<input type="text" name="name" class="form-control mb-2" placeholder="Name" value="<%=rs.getString("name")%>">
<input type="text" name="phone" class="form-control mb-2" placeholder="Phone" value="<%=rs.getString("phone")%>">
<input type="text" name="education" class="form-control mb-2" placeholder="Education" value="<%=rs.getString("education")%>">
<input type="text" name="experience" class="form-control mb-2" placeholder="Experience" value="<%=rs.getString("experience")%>">
<input type="text" name="skills" class="form-control mb-2" placeholder="Skills" value="<%=rs.getString("skills")%>">
<input type="text" name="projects" class="form-control mb-2" placeholder="Projects" value="<%=rs.getString("projects")%>">
<button class="btn btn-success">Update Resume</button>
</div>
</form>

<%
    } else {
%>
<p>Invalid Resume ID or you don't have access.</p>
<%
    }

} catch(Exception e) {
    e.printStackTrace();
} finally {
    try { if(rs != null) rs.close(); } catch(Exception e) {}
    try { if(ps != null) ps.close(); } catch(Exception e) {}
    try { if(conn != null) conn.close(); } catch(Exception e) {}
}
%>

</div>
</body>
</html>