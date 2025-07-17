<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    String user = (String) session.getAttribute("email");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.jsp">Student Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <% if (user != null) { %>
          <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
          <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
      <% } else { %>
      	  <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
          <li class="nav-item"><a class="nav-link" href="signup.jsp">Sign Up</a></li>
      <% } %>

    </ul>
  </div>
</nav>