<%@page import="com.java.lms.LeaveDetailsDAO"%>
<%@page import="com.java.lms.LeaveDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leaves</title>
</head>
<style>
body { 
  background-image: url("3.jpg");
  background-repeat: no-repeat;
background-size:  1380px 730px;;
}
</style>
<body>
<center>
	<table border="5" style="color: MistyRose" >
		<tr>
			<th>leave Id</th>
			<th>no Of Days</th>
			<th>Manager Comments</th>
			<th>emp Id</th>
			<th>leave Start Date</th>
			<th>leave End Date</th>
			<th>leave Status</th>
			<th>leave Type</th>
			<th>leave Reason</th>
		</tr>

	<%
	LeaveDetails[] leavedetailsArray = new LeaveDetailsDAO().showLeave();
	for(LeaveDetails e : leavedetailsArray) {
	%>
		<tr>
			<td> <%=e.getLeaveId() %> </td>
			<td> <%=e.getNoOfDays() %> </td>
			<td> <%=e.getManagerComments() %> </td>
			<td> <%=e.getEmpId() %> </td>
			<td> <%=e.getLeaveStartDate() %> </td>
			<td> <%=e.getLeaveEndDate() %> </td>
			<td> <%=e.getLeaveType() %> </td>
			<td> <%=e.getLeaveStatus() %> </td>
			<td> <%=e.getLeaveReason() %> </td>
		</tr>
	<%
		}
	%>
	</table>
	</center>
</body>
</html>