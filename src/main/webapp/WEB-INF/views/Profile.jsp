<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #f7f9fc;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .profile-container {
        max-width: 900px;
        margin: 40px auto;
        background: #fff;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    }
    .profile-header {
        text-align: center;
        margin-bottom: 30px;
    }
    .profile-header h1 {
        color: #333;
        font-weight: 600;
        margin-bottom: 10px;
    }
    .profile-header p {
        color: #777;
        font-size: 16px;
    }
    .card {
        border: none;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .card:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 12px rgba(0,0,0,0.1);
    }
    .member-card {
        margin-top: 20px;
    }
    .member-title {
        text-align: center;
        margin-top: 40px;
        font-weight: 600;
        color: #333;
    }
</style>
</head>

<body>

	<jsp:include page="Sidebar.jsp" />
	<jsp:include page="Navbar.jsp" />

	<div class="profile-container">
		<div class="profile-header">
			<h1>👤 ${user.firstName} ${user.lastName}</h1>
			<p><strong>Email:</strong> ${user.email}</p>
			<p><strong>Gender:</strong> ${user.gender}</p>
		</div>

		
			<%
				
			%>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
