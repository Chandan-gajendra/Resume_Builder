<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/bg.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container text-center mt-5">
  <h1>Welcome to Student Portal</h1>
  <a href="login.jsp" class="btn btn-primary m-2">Login</a>
  <a href="signup.jsp" class="btn btn-success m-2">Sign Up</a>
</div>
</body>
</html>