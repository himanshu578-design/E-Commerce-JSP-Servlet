<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection" %>

<%
String email = (String) session.getAttribute("email");

if(email == null){
%>
<!DOCTYPE html>
<html>
<head>
<title>Login Required</title>
<style>
body{
    background:#0f172a;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    font-family:'Segoe UI',sans-serif;
}
.box{
    background:#020617;
    color:#fff;
    padding:30px;
    border-radius:16px;
    text-align:center;
}
a{
    display:inline-block;
    margin-top:15px;
    padding:10px 20px;
    background:#22c55e;
    color:#fff;
    text-decoration:none;
    border-radius:8px;
}
</style>
</head>
<body>
<div class="box">
    <h2>Login Required</h2>
    <p>Please login to add items to cart</p>
    <a href="Login.jsp">Login</a>
</div>
</body>
</html>
<%
return;
}
%>

<%
String product_id = request.getParameter("pid");
int quantity = Integer.parseInt(request.getParameter("qty"));

int price = 0;
int total = 0;

try{
    Connection con = DBconnection.getConnection();

    /* ===== GET PRODUCT PRICE ===== */
    PreparedStatement ps = con.prepareStatement(
        "SELECT price FROM product WHERE id=?"
    );
    ps.setString(1, product_id);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        price = rs.getInt("price");
    }
    rs.close();
    ps.close();

    total = price * quantity;

    /* ===== CHECK EXISTING CART ITEM ===== */
    PreparedStatement ps1 = con.prepareStatement(
        "SELECT quantity FROM cart WHERE email=? AND product_id=? AND status='cart'"
    );
    ps1.setString(1, email);
    ps1.setString(2, product_id);
    ResultSet rs1 = ps1.executeQuery();

    if(rs1.next()){
        int newQty = rs1.getInt("quantity") + quantity;
        int newTotal = price * newQty;

        PreparedStatement ps2 = con.prepareStatement(
            "UPDATE cart SET quantity=?, total=? WHERE email=? AND product_id=? AND status='cart'"
        );
        ps2.setInt(1, newQty);
        ps2.setInt(2, newTotal);
        ps2.setString(3, email);
        ps2.setString(4, product_id);
        ps2.executeUpdate();
        ps2.close();

        response.sendRedirect("home.jsp?msg=updated");
    }else{
        /* ===== INSERT NEW CART ITEM ===== */
        PreparedStatement ps3 = con.prepareStatement(
            "INSERT INTO cart(email, product_id, quantity, price, total, status) VALUES(?,?,?,?,?, 'cart')"
        );
        ps3.setString(1, email);
        ps3.setString(2, product_id);
        ps3.setInt(3, quantity);
        ps3.setInt(4, price);
        ps3.setInt(5, total);
        ps3.executeUpdate();
        ps3.close();

        response.sendRedirect("home.jsp?msg=added");
    }

    rs1.close();
    ps1.close();
    con.close();

}catch(Exception e){
    e.printStackTrace();
    response.sendRedirect("home.jsp?msg=error");
}
%>
