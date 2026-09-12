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
String email=request.getParameter("email");
String password=request.getParameter("password");

int z=0;
try
{
   Connection con=DBconnection.getConnection();
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from user where email='"+email+"' and password='"+password+"'");
	
   while(rs.next())
   {
	   z=1;
	   session.setAttribute("email", email);
	   response.sendRedirect("home.jsp");
   }
   if(z==0)
   {
	   response.sendRedirect("Login.jsp?msg=Invalid login details. Please try again&type=error");
   }
}catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("Login.jsp?msg=Oops Something went wrong 😢");
}

%>
</body>
</html>