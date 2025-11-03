<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sidebar</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
    }

    /* Sidebar */
    .sidebar {
        position: fixed;
        top: 0;
        left: -250px;
        width: 250px;
        height: 100%;
        background: linear-gradient(180deg, #ff6a88, #ffb88c);
        color: #fff;
        transition: 0.3s;
        z-index: 1000;
        padding-top: 60px;
        box-shadow: 4px 0 20px rgba(0,0,0,0.3);
        border-radius: 0 15px 15px 0;
    }

    .sidebar.active { left: 0; }

    .sidebar a {
        display: flex;
        align-items: center;
        color: #fff;
        text-decoration: none;
        padding: 15px 25px;
        font-weight: 500;
        border-radius: 10px;
        margin: 5px 15px;
        transition: 0.3s;
    }

    .sidebar a:hover {
        background: rgba(255,255,255,0.2);
        transform: scale(1.05);
    }

    .sidebar i {
        margin-right: 10px;
        font-size: 18px;
    }

    /* Hamburger button */
    .hamburger {
        position: fixed;
        top: 15px;
        left: 15px;
        font-size: 28px;
        cursor: pointer;
        color: #ff6a88;
        z-index: 1100;
        transition: 0.3s;
    }

    .hamburger:hover { transform: scale(1.2); }

    /* Overlay */
    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 0%;
        height: 100%;
        background: rgba(0,0,0,0.4);
        transition: 0.3s;
        z-index: 900;
    }

    .overlay.active { width: 100%; }

    @media (max-width: 768px) { .sidebar { width: 200px; } }
</style>
</head>
<body>

<!-- Hamburger -->
<div class="hamburger" onclick="toggleSidebar()">&#9776;</div>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <a href="userdashboard"><i class="bi bi-house-door-fill"></i> Dashboard</a>
<a href="profile?userId=${user.userId}">
    <i class="bi bi-person-circle"></i> Profile
</a>
    <a href="addactivity1"><i class="bi bi-list-task"></i> Add activty</a>
      <a href="viewactivity"><i class="bi bi-list-task"></i>View activty</a>
     
     <a href="addactivitydb"><i class="bi bi-list-task"></i>Add activity db</a>
     


    <a href="mymember"><i class="bi bi-list-task"></i> My Members</a>
    
    <a href="addmember1?userId=${user.userId}"><i class="bi bi-box-arrow-right"></i>Add Member</a>

    <a href="settings.jsp"><i class="bi bi-gear-fill"></i> Settings</a>
    <a href="logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
</div>

<!-- Overlay -->
<div class="overlay" id="overlay" onclick="toggleSidebar()"></div>

<script>
    function toggleSidebar() {
        document.getElementById('sidebar').classList.toggle('active');
        document.getElementById('overlay').classList.toggle('active');
    }
</script>

</body>
</html>
