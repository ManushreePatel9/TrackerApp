<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.ActivityEntity" %>
<%@ page import="com.entity.MemberEntity" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Activity Log</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="Sidebar.jsp" />
<jsp:include page="Navbar.jsp" />
<div class="container mt-5 shadow p-4 rounded-4">
    <h2 class="mb-4 text-center text-primary">Add Activity Log</h2>

    <!-- Form Start -->
    <form action="addactivity" method="post">

        <!-- ✅ Activity Dropdown -->
        <div class="mb-3">
            <label class="form-label fw-semibold">Select Activity</label>
            <select name="activityId" class="form-control" required>
                <option value="">-- Select Activity --</option>
                <%
                    List<ActivityEntity> activities = (List<ActivityEntity>) request.getAttribute("activityMap");
                    if (activities != null) {
                        for (ActivityEntity act : activities) {
                %>
                            <option value="<%= act.getActivityId() %>">
                                <%= act.getActivityName()  %> 
                            </option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <!-- ✅ Member Dropdown -->
        <div class="mb-3">
            <label class="form-label fw-semibold">Select Member</label>
            <select name="memberId" class="form-control" required>
                <option value="">-- Select Member --</option>
                <%
                    List<MemberEntity> members = (List<MemberEntity>) request.getAttribute("memberMap");
                    if (members != null) {
                        for (MemberEntity mem : members) {
                %>
                            <option value="<%= mem.getMemberId() %>">
                                <%= mem.getFirstName() %> <%= mem.getLastName() %>
                            
                            </option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <!-- ✅ Hidden Logged-in User -->
        <input type="hidden" name="user.userId" value="${user.userId}">

        <!-- ✅ Countable Field -->
        <div class="mb-3">
            <label class="form-label fw-semibold">Countable</label>
            <input type="text" name="countable" class="form-control" placeholder="Enter countable value" required>
        </div>

        <!-- ✅ Notes Field -->
        <div class="mb-3">
            <label class="form-label fw-semibold">Notes</label>
            <input type="text" name="notes" class="form-control" placeholder="Optional notes...">
        </div>

        <!-- ✅ Submit Button -->
        <div class="text-center">
            <button type="submit" class="btn btn-primary px-4">Add Activity</button>
        </div>

    </form>
    <!-- Form End -->
</div>
</body>
</html>
