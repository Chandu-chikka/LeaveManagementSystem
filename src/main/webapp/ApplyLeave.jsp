<%@page import="com.java.lms.LeaveDetailsDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.java.lms.LeaveDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<style>
body {
	
  background-image: url("3.jpg");
  background-repeat: no-repeat;
  background-size:  1380px 730px;;
  color:"MistyRose";
}
</style>
</head>
<body style="color:MistyRose">
	<%
		LeaveDetails leaveDetails = new LeaveDetails();
		leaveDetails.setEmpId(Integer.parseInt(request.getParameter("empId")));
		Date leaveStartDate = Date.valueOf(request.getParameter("leaveStartDate"));
		Date leaveEndDate = Date.valueOf(request.getParameter("leaveEndDate"));
		leaveDetails.setLeaveStartDate(leaveStartDate);
		leaveDetails.setLeaveEndDate(leaveEndDate);
		leaveDetails.setLeaveReason(request.getParameter("leaveReason"));
		LeaveDetailsDAO dao = new LeaveDetailsDAO();
		out.println(dao.applyLeave(leaveDetails));
	%>
</body>
</html>