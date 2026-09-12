<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection" %>
<%@include file="header.jsp" %>

<%
String email = (String)session.getAttribute("email");
if(email == null){
    response.sendRedirect("Login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<style>
body{
  font-family:'Segoe UI',sans-serif;
  background:#0f1115;
  color:#e5e7eb;
}

.container{
  max-width:1200px;
  margin:30px auto;
  padding:20px;
}

.page-title{
  font-size:28px;
  font-weight:700;
  margin-bottom:20px;
}

.order-table{
  width:100%;
  border-collapse:collapse;
  background:#111827;
  border-radius:14px;
  overflow:hidden;
}

.order-table th{
  background:#020617;
  padding:14px;
  font-size:14px;
  text-align:left;
  color:#93c5fd;
}

.order-table td{
  padding:12px;
  border-top:1px solid #1f2937;
  font-size:14px;
}

.order-table tr:hover{
  background:rgba(37,99,235,0.08);
}

.status{
  padding:4px 10px;
  border-radius:20px;
  font-size:12px;
  font-weight:600;
}

.status.ordered{background:#1e3a8a;color:#bfdbfe;}
.status.delivered{background:#14532d;color:#86efac;}
.status.cancelled{background:#7f1d1d;color:#fecaca;}

.price{
  color:#22c55e;
  font-weight:600;
}

.empty{
  text-align:center;
  padding:40px;
  color:#9ca3af;
}
</style>

</head>
<body>

<div class="container">
  <div class="page-title">📦 My Orders</div>

  <table class="order-table">
    <tr>
      <th>S.No</th>
      <th>Product Name</th>
      <th>Category</th>
      <th>Price</th>
      <th>Qty</th>
      <th>Sub Total</th>
      <th>Order Date</th>
      <th>Delivery Date</th>
      <th>Payment</th>
      <th>Status</th>
    </tr>

<%
int sno = 0;
boolean hasData = false;

try{
    Connection con = DBconnection.getConnection();
    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM cart INNER JOIN product " +
        "ON cart.product_id = product.id " +
        "WHERE cart.email=? AND cart.orderDate IS NOT NULL"
    );
    ps.setString(1,email);
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
        hasData = true;
        sno++;
%>
    <tr>
      <td><%=sno%></td>
      <td><%=rs.getString("name")%></td>
      <td><%=rs.getString("category")%></td>
      <td class="price">₹ <%=rs.getInt("price")%></td>
      <td><%=rs.getInt("quantity")%></td>
      <td class="price">₹ <%=rs.getInt("price") * rs.getInt("quantity") %></td>
      <td><%=rs.getString("orderDate")%></td>
      <td><%=rs.getString("deliveryDate")%></td>
      <td><%=rs.getString("paymentMethod")%></td>
      <td>
        <span class="status <%=rs.getString("status").toLowerCase()%>">
          <%=rs.getString("status")%>
        </span>
      </td>
    </tr>
<%
    }
}catch(Exception e){
    e.printStackTrace();
}

if(!hasData){
%>
    <tr>
      <td colspan="10" class="empty">
        😔 No orders found
      </td>
    </tr>
<%
}
%>

  </table>
</div>

</body>
</html>

<%@include file="footer.jsp" %>
