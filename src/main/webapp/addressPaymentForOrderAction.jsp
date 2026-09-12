<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection" %>

<%
String email = request.getParameter("email");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobile = request.getParameter("mobile");
String paymentMethod = request.getParameter("payment"); // COD / UPI / CARD
String transactionId = request.getParameter("UPI_id");
String status = "bill";

Connection con = null;

try {
    con = DBconnection.getConnection();
    con.setAutoCommit(false); // 🔥 transaction start

    /* ================= UPDATE CART ITEMS TO BILL ================= */
    PreparedStatement ps1 = con.prepareStatement(
        "UPDATE cart SET address=?, city=?, state=?, country=?, mobileNumber=?, " +
        "orderDate=NOW(), deliveryDate=DATE_ADD(NOW(), INTERVAL 7 DAY), " +
        "paymentMethod=?, transactionId=?, status=? " +
        "WHERE email=? AND (status IS NULL OR status='cart')"
    );

    ps1.setString(1, address);
    ps1.setString(2, city);
    ps1.setString(3, state);
    ps1.setString(4, country);
    ps1.setString(5, mobile);
    ps1.setString(6, paymentMethod);
    ps1.setString(7, transactionId);
    ps1.setString(8, status);
    ps1.setString(9, email);

    ps1.executeUpdate();
    ps1.close();

    /* ================= CLEAR CART (REMOVE OLD CART ITEMS) ================= */
    PreparedStatement ps2 = con.prepareStatement(
        "DELETE FROM cart WHERE email=? AND status='cart'"
    );
    ps2.setString(1, email);
    ps2.executeUpdate();
    ps2.close();

    con.commit();
    con.close();

    response.sendRedirect("bill.jsp");

} catch (Exception e) {
    if (con != null) {
        try { con.rollback(); } catch (Exception ex) {}
    }
    e.printStackTrace();
    out.println("ERROR : " + e.getMessage());
}
%>
