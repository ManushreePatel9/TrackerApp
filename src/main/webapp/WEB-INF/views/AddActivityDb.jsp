<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Activity</title>

<!-- ✅ Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #f9fafc;
        font-family: 'Poppins', sans-serif;
    }

    .container {
        margin-top: 80px;
        max-width: 600px;
    }

    .card {
        border: none;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
    }

    .card-header {
        background: linear-gradient(135deg, #007bff, #00b4d8);
        color: white;
        text-align: center;
        font-size: 1.3rem;
        font-weight: 600;
        border-radius: 15px 15px 0 0;
        padding: 15px 0;
    }

    .btn-custom {
        background-color: #007bff;
        border: none;
        border-radius: 10px;
        padding: 10px 20px;
        font-weight: 500;
        transition: 0.3s ease;
    }

    .btn-custom:hover {
        background-color: #0056b3;
        transform: scale(1.03);
    }

    .msg {
        text-align: center;
        margin-top: 10px;
        font-weight: 500;
        color: green;
    }
</style>
</head>

<body>
    <jsp:include page="Sidebar.jsp" />
    <jsp:include page="Navbar.jsp" />

    <div class="container">
        <div class="card">
            <div class="card-header">
                ➕ Add New Activity
            </div>

            <div class="card-body">
                <form action="addActivityDB" method="post">

                    <!-- Activity Name -->
                    <div class="mb-3">
                        <label class="form-label">Activity Name</label>
                        <input type="text" name="activityName" class="form-control" placeholder="Enter activity name" required>
                    </div>

                    <!-- Hidden User ID -->
                    <input type="hidden" name="user.userId" value="${user.userId}">

                    <!-- Submit Button -->
                    <div class="d-grid">
                        <button type="submit" class="btn btn-custom">Add Activity</button>
                    </div>

                    <!-- Message -->
                    <div class="msg">
                        ${msg}
                    </div>
                </form>
            </div>
        </div>
    </div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
