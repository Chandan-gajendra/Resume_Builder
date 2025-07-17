<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/bg.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container mt-5">
  <h2>Sign Up</h2>
  <form action="SignupServlet" method="post">
    <input type="text" name="name" placeholder="Name" class="form-control mb-2" required>
    <input type="email" name="email" placeholder="Email" class="form-control mb-2" required>
    <input type="password" name="password" placeholder="Password" class="form-control mb-2" required>
    <button type="submit" class="btn btn-success">Sign Up</button>
  </form>
</div>
</body>
</html>