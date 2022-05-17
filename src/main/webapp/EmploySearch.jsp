<%@page import="com.java.lms.EmployeeDAO"%>
<%@page import="com.java.lms.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Search</title>
</head>
<style>
body { 
  background-image: url("3.jpg");
  background-repeat: no-repeat;
  background-size:  1380px 730px;
  text-align: center;
  font-size: 19px;

}
</style>

<body style="color:MistyRose" >

	<%
		int emp_id = Integer.parseInt(request.getParameter("emp_id"));
		Employee employee = new EmployeeDAO().searchEmploy(emp_id);
		if (employee!=null) {
			out.println("Employee Name  :  "+employee.getEmpName()+("<BR>"));
			out.println("Employee Email  :  " +employee.getEmpEmail()+("<BR>"));
			out.println("Employee Mobileno  : " +employee.getEmpMobile()+("<BR>"));
			
		}
	%>

</body>
</html>