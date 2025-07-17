<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Resume Builder</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/bg.js"></script>

<!-- jsPDF from CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container mt-4">
  <h2 class="mb-4">Resume Builder</h2>

  <form id="resumeForm" method="post">
    <div class="card p-3 mb-4">
      <h4>Personal Information</h4>
      <input type="text" name="name" placeholder="Full Name" class="form-control mb-2" required>
      <input type="email" name="email" placeholder="Email" class="form-control mb-2" required>
      <input type="text" name="phone" placeholder="Phone Number" class="form-control mb-2">
    </div>

    <div class="card p-3 mb-4">
      <h4>Education</h4>
      <textarea name="education" placeholder="Your Education" class="form-control" rows="3"></textarea>
    </div>

    <div class="card p-3 mb-4">
      <h4>Work Experience</h4>
      <textarea name="experience" placeholder="Your Work Experience" class="form-control" rows="3"></textarea>
    </div>

    <div class="card p-3 mb-4">
      <h4>Skills</h4>
      <textarea name="skills" placeholder="List your skills" class="form-control" rows="3"></textarea>
    </div>

    <div class="card p-3 mb-4">
      <h4>Projects</h4>
      <textarea name="projects" placeholder="Your Projects" class="form-control" rows="3"></textarea>
    </div>

    <button type="button" class="btn btn-success btn-lg" onclick="generatePreview()">Preview Resume</button>
    <button type="button" class="btn btn-primary btn-lg mt-3" onclick="downloadPDF()">Download as PDF</button>
    <button type="submit" formaction="SaveResumeServlet" class="btn btn-success btn-lg mt-3">Submit & Save</button>
  </form>

  <hr class="my-4">

  <h3>Resume Preview</h3>
  <div id="preview" class="p-3 bg-white text-dark border rounded" style="min-height:200px;">
    <em>Fill out the form above and click "Preview Resume" to see here.</em>
  </div>
</div>

<script>
function generatePreview() {
  const form = document.getElementById('resumeForm');
  const preview = document.getElementById('preview');

  let html = `
    <h4>${form.name.value}</h4>
    <p>Email: ${form.email.value}</p>
    <p>Phone: ${form.phone.value}</p>
    <hr>
    <h5>Education</h5><p>${form.education.value}</p>
    <h5>Work Experience</h5><p>${form.experience.value}</p>
    <h5>Skills</h5><p>${form.skills.value}</p>
    <h5>Projects</h5><p>${form.projects.value}</p>
  `;

  preview.innerHTML = html;
}

async function downloadPDF() {
  const { jsPDF } = window.jspdf;
  const doc = new jsPDF();

  const form = document.getElementById('resumeForm');

  let y = 10;

  doc.setFontSize(16);
  doc.text(form.name.value, 10, y);
  y += 10;

  doc.setFontSize(12);
  doc.text(`Email: ${form.email.value}`, 10, y);
  y += 7;
  doc.text(`Phone: ${form.phone.value}`, 10, y);
  y += 10;

  doc.setFontSize(14);
  doc.text("Education", 10, y);
  y += 7;
  doc.setFontSize(12);
  doc.text(form.education.value, 10, y);
  y += 10;

  doc.setFontSize(14);
  doc.text("Work Experience", 10, y);
  y += 7;
  doc.setFontSize(12);
  doc.text(form.experience.value, 10, y);
  y += 10;

  doc.setFontSize(14);
  doc.text("Skills", 10, y);
  y += 7;
  doc.setFontSize(12);
  doc.text(form.skills.value, 10, y);
  y += 10;

  doc.setFontSize(14);
  doc.text("Projects", 10, y);
  y += 7;
  doc.setFontSize(12);
  doc.text(form.projects.value, 10, y);
  y += 10;

  const fileName = form.name.value.replace(/\s+/g, '_') + '_Resume.pdf';
  doc.save(fileName);
}
</script>

</body>
</html>