<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.entity.ActivityLog" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Activity Logs</title>
<link rel="stylesheet"
 href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="Sidebar.jsp"/>
<jsp:include page="Navbar.jsp"/>

<div class="container mt-4">
  <h2 class="text-center mb-4">Activity Logs</h2>

  <table class="table table-bordered table-hover table-striped">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Activity Name</th>
        <th>Member Name</th>
        <th>User Name</th>
        <th>Countable</th>
        <th>Notes</th>
        <th>Log Date Time</th>
      </tr>
    </thead>
    <tbody>
      <%
        // Retrieve the logs list from request or session
        List<ActivityLog> logs = (List<ActivityLog>) request.getAttribute("logs");

        if (logs != null && !logs.isEmpty()) {
            for (ActivityLog log : logs) {
      %>
              <tr>
                <td><%= log.getActivityLogId() %></td>
                <td><%= log.getActivityId().getActivityName() %></td>
                <td><%= log.getMemberId().getFirstName() %></td>
                <td><%= log.getUser().getFirstName() %> <%= log.getUser().getLastName() %></td>
                <td><%= log.getCountable() %></td>
                <td><%= log.getNotes() %></td>
                <td><%= log.getLogDateTime() %></td>
              </tr>
      <%
            }
        } else {
      %>
            <tr>
              <td colspan="7" class="text-center text-danger">No logs available</td>
            </tr>
      <%
        }
      %>
    </tbody>
  </table>
</div>

</body>
</html>
