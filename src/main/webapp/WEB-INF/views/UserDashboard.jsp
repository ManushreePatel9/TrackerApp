<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tracker App Dashboard</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #ffecd2, #fcb69f);
        margin: 0;
    }

    .dashboard-container {
        padding: 40px;
        margin-left: 270px;
    }

    @media (max-width: 768px) {
        .dashboard-container { margin-left: 20px; padding: 20px; }
    }

    /* Welcome Message */
    .welcome-header {
        font-size: 32px;
        color: #ff6a88;
        font-weight: 600;
        margin-bottom: 25px;
        text-align: left;
    }

    /* Motivational Quote */
    .quote-card {
        background: rgba(255, 255, 255, 0.85);
        border-radius: 20px;
        padding: 25px 20px;
        text-align: center;
        margin-bottom: 30px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        transition: 0.3s;
    }
    .quote-card:hover {
        transform: scale(1.02);
        box-shadow: 0 12px 25px rgba(0,0,0,0.3);
    }
    .quote-card i { font-size: 30px; color: #ff6a88; margin-bottom: 10px; }
    .quote-card h4 { color: #ff6a88; font-weight: 600; }
    .quote-card p { color: #333; font-style: italic; }

    /* Stats cards (currently commented out) */
    .stats-card {
        border-radius: 20px;
        background: rgba(255, 255, 255, 0.9);
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        padding: 20px;
        text-align: center;
        transition: 0.3s;
    }
    .stats-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 30px rgba(0,0,0,0.3);
    }
    .stats-card i {
        font-size: 40px;
        color: #ff6a88;
        margin-bottom: 15px;
    }
    .stats-card h5 { font-weight: 600; color: #ff6a88; }
    .stats-card p { color: #333; }
</style>
</head>
<body>

<!-- Include Sidebar -->
<jsp:include page="Sidebar.jsp" />
<jsp:include page="Navbar.jsp" />


<div class="dashboard-container">
    <!-- Welcome Message -->


    <!-- Motivational Quote -->
    <div class="quote-card">
        <i class="bi bi-lightning-fill"></i>
        <h4>“Track to Transform”</h4>
        <p>Consistency is key. Track your activities and see your growth.</p>
    </div>

    <!-- Stats / Progress Cards -->
    <!--
    <div class="row mt-4">
        <div class="col-md-4 mb-3">
            <div class="stats-card">
                <i class="bi bi-check2-circle"></i>
                <h5>Tasks Completed</h5>
                <p>12 tasks finished this week!</p>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="stats-card">
                <i class="bi bi-clock-history"></i>
                <h5>Time Tracked</h5>
                <p>24 hours logged on activities this month.</p>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="stats-card">
                <i class="bi bi-graph-up"></i>
                <h5>Progress</h5>
                <p>80% of your weekly goals achieved!</p>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-6 mb-3">
            <div class="stats-card">
                <i class="bi bi-lightbulb-fill"></i>
                <h5>Insights</h5>
                <p>Focus on your most productive hours for better results.</p>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="stats-card">
                <i class="bi bi-award-fill"></i>
                <h5>Achievements</h5>
                <p>You earned 3 badges this month! Keep it up!</p>
            </div>
        </div>
    </div>
    -->
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
