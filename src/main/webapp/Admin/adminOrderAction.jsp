<%@ page import="java.sql.*,Project1.DBconnection" %>

<%
String email = request.getParameter("email");
String status = request.getParameter("status");

try{
Connection con = DBconnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE cart SET status=? WHERE email=? AND status='processing'"
);

ps.setString(1,status);
ps.setString(2,email);

ps.executeUpdate();

response.sendRedirect("Recieved-Order.jsp");

}catch(Exception e){
e.printStackTrace();
}
%>