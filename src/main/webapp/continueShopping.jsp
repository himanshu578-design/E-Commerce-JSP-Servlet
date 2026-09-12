<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, Project1.DBconnection" %>
    
<%
  String email=(String)session.getAttribute("email");
  String status="processing";
  try
  {
	 Connection con=DBconnection.getConnection();
	 PreparedStatement ps=con.prepareStatement("update cart set status=? where email=? and status='bill'");
	 ps.setString(1,status);
	 ps.setString(2,email);
	 ps.executeUpdate();
	 response.sendRedirect("home.jsp");
  }catch(Exception e)
  {
	  System.out.println(e);
	  
  }
%>