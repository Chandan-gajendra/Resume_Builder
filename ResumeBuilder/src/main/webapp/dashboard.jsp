<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Dashboard</title>
<script src="js/bg.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.card-hover:hover {
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
  transform: translateY(-2px);
  transition: all 0.3s ease-in-out;
}
</style>
</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container mt-5">
  <h2 class="text-center mb-4">Welcome to Your Student Dashboard</h2>

  <div class="row">
    <!-- Resume Builder -->
    <div class="col-md-6 mb-4">
      <div class="card card-hover p-3">
        <h4>Build Your Resume</h4>
        <p>Create a professional resume easily using our guided builder. Fill in your details and download a PDF!</p>
        <a href="resumeBuilder.jsp" class="btn btn-primary">Start Building</a>
      </div>
    </div>

    <!-- View/Edit/Delete Resumes -->
    <div class="col-md-6 mb-4">
      <div class="card card-hover p-3">
        <h4>Manage Your Resumes</h4>
        <p>View, edit or delete your saved resumes anytime. Keep your information up-to-date!</p>
        <a href="viewResume.jsp" class="btn btn-primary">View Resumes</a>
      </div>
    </div>
  </div>

  <div class="row">
    <!-- Profile -->
    <div class="col-md-6 mb-4">
      <div class="card card-hover p-3">
        <h4>Your Profile</h4>
        <p>Check and update your profile details like name, email etc.</p>
        <a href="profile.jsp" class="btn btn-primary">View Profile</a>
      </div>
    </div>

    <!-- Logout -->
    <div class="col-md-6 mb-4">
      <div class="card card-hover p-3">
        <h4>Logout</h4>
        <p>Securely logout from the portal when you're done.</p>
        <a href="logout.jsp" class="btn btn-danger">Logout</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>