<%@page import="com.entity.MemberEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Members</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #f7f9fc;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    h1 {
        text-align: center;
        margin: 30px 0;
        color: #333;
    }
    .members-table {
        max-width: 800px;
        margin: auto;
        background: #fff;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .btn-action {
        padding: 5px 10px;
        border-radius: 6px;
        font-size: 14px;
    }
</style>
</head>
<body>

<jsp:include page="Sidebar.jsp" />
<jsp:include page="Navbar.jsp" />

<h1>All Members</h1>

<div class="members-table">
    <table class="table table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                java.util.List membersList = (java.util.List) request.getAttribute("members");
                if (membersList != null && !membersList.isEmpty()) {
                    for (Object obj : membersList) {
                        MemberEntity member = (MemberEntity) obj;
            %>
            <tr>
                <td><%= member.getFirstName() %></td>
                <td><%= member.getLastName() %></td>
                <td>
                    <a href="updateMember?id=<%= member.getMemberId() %>" class="btn btn-warning btn-sm btn-action">Update</a>
                    <a href="deleteMember?id=<%= member.getMemberId() %>" class="btn btn-danger btn-sm btn-action"
                       onclick="return confirm('Are you sure you want to delete this member?');">Delete</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="3" class="text-center">No members found</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
