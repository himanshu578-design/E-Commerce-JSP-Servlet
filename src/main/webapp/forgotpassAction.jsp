<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.* , Project1.DBconnection" %>

<%
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String question = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newpass = request.getParameter("newPassword");

try {

    Connection con = DBconnection.getConnection();
    if(con == null){
        response.sendRedirect("forgotpass.jsp?msg=DB Connection Failed");
        return;
    }

    String sql = "SELECT * FROM user WHERE email=? AND mobileNumber=? AND securityQuestion=? AND answer=?";
    PreparedStatement ps = con.prepareStatement(sql);

    ps.setString(1, email);
    ps.setString(2, mobile);
    ps.setString(3, question);
    ps.setString(4, answer);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){

        String update = "UPDATE user SET password=? WHERE email=?";
        PreparedStatement ps2 = con.prepareStatement(update);
        ps2.setString(1, newpass);
        ps2.setString(2, email);
        ps2.executeUpdate();

        response.sendRedirect("forgotpass.jsp?msg=Password Reset Successfully");
    }
    else {
        response.sendRedirect("forgotpass.jsp?msg=Invalid Details");
    }

} catch(Exception e) {
    e.printStackTrace();
    response.sendRedirect("forgotpass.jsp?msg=Server Error");
}
%>
