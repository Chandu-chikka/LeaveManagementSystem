<%@page import="com.java.lms.EmployeeDAO"%>
<%@page import="com.java.lms.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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