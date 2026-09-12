<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");

if("admin178@gmail.com".equals(email) && "admin123".equals(password))
{
    session.setAttribute("email", email);
    response.sendRedirect("adminHome.jsp?msg=Admin Login Successfullyyy");
}
else
{
    //session.setAttribute("msg", "Invalid Admin Credential");	
    response.sendRedirect("adminlogin.jsp?msg=Invalid Admin Credential");
}
%>
</body>
</html>