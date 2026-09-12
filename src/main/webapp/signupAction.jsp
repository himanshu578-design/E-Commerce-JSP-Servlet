<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.* , Project1.DBconnection" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
String address=request.getParameter("address");
String city="";
String state="";
String country="";

try
{
   Connection con=DBconnection.getConnection();
   PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?)");
   ps.setString(1, name);
   ps.setString(2, email);
   ps.setString(3, mobile);
   ps.setString(4, securityQuestion);
   ps.setString(5, answer);
   ps.setString(6, password);
   ps.setString(7, address);
   ps.setString(8, city);
   ps.setString(9, state);
   ps.setString(10, country);
   
   ps.executeUpdate();
   response.sendRedirect("Signup.jsp?msg=Signup Successfully&type=success");
}catch(Exception e)
{
      e.printStackTrace();	
      response.sendRedirect("Signup.jsp?msg=Email Already Exists&type=error");
}

%>
</body>
</html>