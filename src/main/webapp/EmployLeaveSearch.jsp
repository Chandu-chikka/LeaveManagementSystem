<%@page import="com.java.lms.LeaveDetails"%>
<%@page import="com.java.lms.LeaveDetailsDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employees Leaves by ID</title>
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
<table border="5" style="color:MistyRose">

	<tr>
	
	<th>Leave Id</th>
	<th>No.Of Days</th>
	<th>Manager Comments</th>
	<th>Employ Id</th>
	<th>Leave Start Date</th>
	<th>Leave End Date</th>
	<th>Leave Type</th>
	<th>Leave Status</th>
	<th>Leave Reason</th>
	
	</tr>

	<%
		int empId = Integer.parseInt(request.getParameter("empno"));
		LeaveDetailsDAO dao = new LeaveDetailsDAO();
		LeaveDetails[] history = dao.leaveHistory(empId);
	for(LeaveDetails ld : history) {
	%>
		<tr>
			<td><%=ld.getLeaveId() %> </td>
			<td><%=ld.getNoOfDays() %> </td>
			<td><%=ld.getManagerComments() %> </td>
			<td><%=ld.getEmpId() %> </td>
			<td><%=ld.getLeaveStartDate() %> </td>
			<td><%=ld.getLeaveEndDate() %> </td>
			<td><%=ld.getLeaveType() %> </td>
			<td><%=ld.getLeaveStatus() %> </td>
			<td><%=ld.getLeaveReason() %> </td>
		</tr>
	<%
	}
	%>
	</center>
</table>
</body>
</html>