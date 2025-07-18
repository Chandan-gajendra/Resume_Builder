🎓 Student Portal Web App
A simple web application built with JSP + Servlets + Bootstrap + PostgreSQL, where students can:
✅ Register & Login
✅ Build and Save Resume(s)
✅ View, Edit, and Delete Resumes
✅ Manage Profile & Logout
✅ Dashboard with clear options

🚀 Features
Responsive design with Bootstrap

Common Navbar on all pages

Random background image support (optional)

User authentication with session

PostgreSQL as backend database

Resume Builder: name, phone, education, experience, skills, projects

Manage resumes: view, edit, delete

Profile page shows logged-in user info

📂 Project Structure
/WebContent/
├── index.jsp
├── navbar.jsp
├── login.jsp
├── signup.jsp
├── dashboard.jsp
├── profile.jsp
├── resumeBuilder.jsp
├── viewResume.jsp
├── editResume.jsp
├── logout.jsp

/src/com/studentportal/
├── LoginServlet.java
├── SignupServlet.java
├── SaveResumeServlet.java
├── EditResumeServlet.java
├── DeleteResumeServlet.java

/lib/
└── postgresql.jar
🛠️ Setup & Run
📋 Prerequisites
Java 8+ & Eclipse IDE

Apache Tomcat 9+

PostgreSQL database

PostgreSQL JDBC driver (postgresql.jar)

🗄️ Database Setup
1️⃣ Create a database called:

sql:
CREATE DATABASE student_portal;
2️⃣ Create tables:

sql:
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

CREATE TABLE resumes (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) REFERENCES students(email),
    name VARCHAR(100),
    phone VARCHAR(20),
    education TEXT,
    experience TEXT,
    skills TEXT,
    projects TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

🧪 Configure
✅ Open the project in Eclipse.
✅ Right-click > Build Path > Add Libraries > Add Server Runtime > Tomcat.
✅ Put postgresql.jar into /lib and also add it to build path.
✅ In all servlets (Login, Signup, SaveResume, EditResume, DeleteResume) — change the DB credentials:

java:
Connection conn = DriverManager.getConnection(
    "jdbc:postgresql://localhost:5432/student_portal",
    "postgres", 
    "yourpassword");
Replace yourpassword with your PostgreSQL password.

🌐 Run
✅ Start Tomcat server in Eclipse.
✅ Visit: http://localhost:8080/YourProjectName

📄 Pages
Page	URL	Description
🏠 Home	/index.jsp	Welcome page with Login & Signup
🔐 Login	/login.jsp	Student Login
✍️ Signup	/signup.jsp	Student Registration
🖥️ Dashboard	/dashboard.jsp	Main panel with options
👤 Profile	/profile.jsp	Shows logged-in student info
📄 Build Resume	/resumeBuilder.jsp	Form to create & save resume
📋 View Resumes	/viewResume.jsp	Lists resumes with edit/delete
📝 Edit Resume	/editResume.jsp	Update an existing resume
🚪 Logout	/logout.jsp	Ends session & redirects to home

🧹 Optional Enhancements
✨ Add Bootstrap modals for confirmation
✨ Add random background images
✨ Add PDF download for resumes
✨ Add user profile editing

🤝 Credits
Built by ❤️ with JSP + Servlets + Bootstrap + PostgreSQL
