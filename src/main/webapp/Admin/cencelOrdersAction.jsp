<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Project1.DBconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status=request.getParameter("status");

try{
    Connection con = DBconnection.getConnection();
	PreparedStatement ps=con.prepareStatement("update cart set status=? where product_id=? and email=? and address is not null");
	ps.setString(1, status);
	ps.setInt(2,Integer.parseInt(id));
	ps.setString(3, email);
	
	int i=ps.executeUpdate();
	
	 if(i > 0){
	        response.sendRedirect("Recieved-Order.jsp?msg=Order cencelled Successfully");
	    } else {
	        response.sendRedirect("Recieved-Order.jsp?msg=Wrong");
	    }
	
}catch(Exception e)
{
	e.printStackTrace();
	}
%>