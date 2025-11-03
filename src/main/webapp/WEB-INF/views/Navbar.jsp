<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Dark Modern Fixed Navbar -->
<nav class="navbar navbar-expand-lg fixed-top"
     style="background: linear-gradient(135deg, #1a1a2e, #162447);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            width: 100%;
            z-index: 999;">
    <div class="container-fluid justify-content-center position-relative">
        <!-- Centered Welcome Text -->
        <span class="navbar-brand mb-0 h1 text-center"
              style="font-weight: 600; color: #ff6a88;">
            Welcome ${user.firstName}
        </span>

        <!-- Right-aligned icons -->
        <div class="d-flex position-absolute end-0 me-4 align-items-center">
            <a href="settings.jsp" class="nav-link me-3"
               style="color: #ff6a88; font-size: 20px;" title="Settings">
                <i class="bi bi-gear-fill"></i>
            </a>
            <a href="logout" class="nav-link"
               style="color: #ff6a88; font-size: 20px;" title="Logout">
                <i class="bi bi-box-arrow-right"></i>
            </a>
        </div>
    </div>
</nav>

<!-- Optional CSS -->
<style>
    body {
        margin: 0;
        padding: 0;
        overflow-x: hidden; /* ✅ remove horizontal scroll */
        font-family: 'Poppins', sans-serif;
    }

    /* To prevent content from hiding behind fixed navbar */
    main {
        padding-top: 70px; /* height of navbar */
    }

    .navbar {
        height: 60px;
    }

    .navbar .nav-link:hover {
        color: #ff9eb3;
        transform: scale(1.1);
        transition: all 0.2s ease;
    }

    .navbar-brand {
        font-size: 22px;
    }
</style>

<!-- Use <main> tag in all pages below navbar -->
<main>
    <!-- your page content here -->
</main>
