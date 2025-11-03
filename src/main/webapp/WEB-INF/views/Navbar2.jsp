<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkillAcademy Dashboard</title>

<!-- Google Fonts & Icons -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background: #f4f6f8;
        transition: background 0.3s ease;
    }

    /* Navbar */
    .navbar {
        width: 100%;
        height: 65px;
        background: linear-gradient(135deg, #7c3aed, #3b82f6);
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 25px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        position: fixed;
        top: 0;
        z-index: 1000;
    }

    .navbar .left {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .navbar .logo {
        display: flex;
        align-items: center;
        gap: 8px;
        color: white;
        font-size: 20px;
        font-weight: 600;
        letter-spacing: 0.5px;
    }

    .navbar .logo i {
        font-size: 22px;
        color: #fff;
    }

    .navbar .logout-btn {
        background: white;
        color: #3b82f6;
        padding: 8px 18px;
        border: none;
        border-radius: 6px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .navbar .logout-btn:hover {
        background: #3b82f6;
        color: white;
        box-shadow: 0 4px 10px rgba(59,130,246,0.4);
    }

    /* Hamburger Button */
    .hamburger {
        cursor: pointer;
        width: 28px;
        height: 20px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        position: relative;
        z-index: 1100;
    }

    .hamburger div {
        width: 100%;
        height: 3px;
        background-color: #fff;
        border-radius: 3px;
        transition: all 0.3s ease;
    }

    .hamburger.active div:nth-child(1) {
        transform: rotate(45deg) translateY(8px);
    }

    .hamburger.active div:nth-child(2) {
        opacity: 0;
    }

    .hamburger.active div:nth-child(3) {
        transform: rotate(-45deg) translateY(-8px);
    }

    /* Sidebar */
    .sidebar {
        position: fixed;
        left: -250px;
        top: 0;
        height: 100vh;
        width: 250px;
        background: linear-gradient(135deg, #7c3aed, #3b82f6);
        box-shadow: 3px 0 15px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: start;
        padding-top: 80px; /* for navbar space */
        transition: left 0.4s ease;
        overflow-x: hidden;
        z-index: 999;
    }

    .sidebar.active {
        left: 0;
    }

    .sidebar:hover {
        width: 270px;
    }

    /* Nav Links */
    .sidebar a {
        text-decoration: none;
        color: #f9fafb;
        width: 100%;
        padding: 14px 20px;
        display: flex;
        align-items: center;
        gap: 15px;
        font-size: 15px;
        transition: all 0.3s ease;
        border-radius: 0 25px 25px 0;
    }

    .sidebar a:hover {
        background: #f9fafb;
        color: #3b82f6;
        transform: translateX(8px);
    }

    .sidebar a i {
        font-size: 18px;
        min-width: 25px;
        text-align: center;
    }

    /* Logout Link in Sidebar (optional backup) */
    .logout {
        margin-top: auto;
        margin-bottom: 30px;
        width: 100%;
    }

    .logout a {
        background: rgba(255,255,255,0.15);
        border-top: 1px solid rgba(255,255,255,0.3);
    }

    .logout a:hover {
        background: #ef4444;
        color: #fff;
        transform: translateX(0);
    }

    /* Hover animation on icons */
    @keyframes bounce {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-3px); }
    }

    .sidebar a:hover i {
        animation: bounce 0.4s;
    }

    /* Overlay */
    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.4);
        backdrop-filter: blur(4px);
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
        z-index: 900;
    }

    .overlay.active {
        opacity: 1;
        visibility: visible;
    }

    /* Page Content */
    .content {
        padding-top: 80px;
        text-align: center;
    }

    .content h2 {
        color: #1e3a8a;
    }

</style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="left">
        <div class="hamburger" id="hamburger">
            <div></div>
            <div></div>
            <div></div>
        </div>
        <div class="logo">
            <i class="fa-solid fa-graduation-cap"></i>
            <span>SkillAcademy</span>
        </div>
    </div>
    <form action="logout" method="post">
        <button type="submit" class="logout-btn">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </button>
    </form>
</div>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <a href="teacherDashboard.jsp"><i class="fa-solid fa-house"></i><span>Dashboard</span></a>
    <a href="manageCourses.jsp"><i class="fa-solid fa-book"></i><span>Manage Courses</span></a>
    <a href="students.jsp"><i class="fa-solid fa-users"></i><span>Students</span></a>
    <a href="assignments.jsp"><i class="fa-solid fa-file-lines"></i><span>Assignments</span></a>
    <a href="analytics.jsp"><i class="fa-solid fa-chart-line"></i><span>Analytics</span></a>
    <a href="announcements.jsp"><i class="fa-solid fa-bullhorn"></i><span>Announcements</span></a>
    <a href="profile.jsp"><i class="fa-solid fa-user"></i><span>Profile</span></a>

    <div class="logout">
        <a href="logout.jsp"><i class="fa-solid fa-right-from-bracket"></i><span>Logout</span></a>
    </div>
</div>

<!-- Overlay -->
<div class="overlay" id="overlay"></div>

<!-- Page Content -->
<div class="content">
    <h2>Welcome to SkillAcademy Teacher Dashboard</h2>
</div>

<!-- JS -->
<script>
    const hamburger = document.getElementById('hamburger');
    const sidebar = document.getElementById('sidebar');
    const overlay = document.getElementById('overlay');

    hamburger.addEventListener('click', () => {
        hamburger.classList.toggle('active');
        sidebar.classList.toggle('active');
        overlay.classList.toggle('active');
    });

    overlay.addEventListener('click', () => {
        hamburger.classList.remove('active');
        sidebar.classList.remove('active');
        overlay.classList.remove('active');
    });
</script>

</body>
</html>
