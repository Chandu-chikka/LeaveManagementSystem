<%@page import="com.java.lms.EmployeeDAO"%>
<%@page import="com.java.lms.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Show</title>
<style>
body {
    
  background-image: url("3.jpg");
  background-repeat: no-repeat;
background-size:  cover;
}
</style>
</head>
<body>
	<center>
	<table border="5"style="color:MistyRose" >
		<tr>
			<th>Employ ID</th>
			<th>Employ Name</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Date of Birth</th>
			<th>Department</th>
			<th>ManagerId</th>
			<th>Available Balance</th>
		</tr>

	<%
		Employee[] employArray = new EmployeeDAO().showEmploy();
		for(Employee e : employArray) {
	%>
		<tr>
			<td> <%=e.getEmpId() %> </td>
			<td> <%=e.getEmpName() %> </td>
			<td> <%=e.getEmpEmail() %>  </td>
			<td> <%=e.getEmpMobile() %> </td>
			<td> <%=e.getEmpDob() %> </td>
			<td> <%=e.getEmpDept() %> </td>
			<td> <%=e.getMgrId() %> </td>
			<td> <%=e.getLeaveAvail() %> </td>
		</tr>
	<%
		}
	%>
	</table>
	</center>
</body>
</html>