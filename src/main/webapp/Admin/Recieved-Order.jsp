<%@page import="Project1.DBconnection"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="adminHeader.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Received Orders</title>

<style>
body{
    font-family: Arial;
    background:#0f172a;
    color:white;
    padding:20px;
}

h2{
    text-align:center;
    margin-bottom:20px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:#1e293b;
}

th, td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #334155;
}

th{
    background:#2563eb;
}

tr:hover{
    background:#334155;
}

button{
    padding:6px 12px;
    border:none;
    border-radius:5px;
    cursor:pointer;
}

.cancel{
    background:red;
    color:white;
}

.delivered{
    background:green;
    color:white;
}
</style>

</head>
<body>

<h2>Received Orders</h2>

<table>
<tr>
    <th>Mobile Number</th>
    <th>Product Name</th>
    <th>Quantity</th>
    <th>Sub Total</th>
    <th>Address</th>
    <th>City</th>
    <th>State</th>
    <th>Country</th>
    <th>Order Date</th>
    <th>Expected Delivery</th>
    <th>Payment Method</th>
    <th>Status</th>
    <th>Cancel</th>
    <th>Delivered</th>
</tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
    con=DBconnection.getConnection();
    String query = "select * from cart inner join product on cart.product_id=product.id where cart.orderDate is not null and cart.status='processing'";
    ps = con.prepareStatement(query);

    rs = ps.executeQuery();

    while(rs.next()){
%>

<tr>
    <td><%=rs.getString("mobileNumber")%></td>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getInt("quantity")%></td>
    <td><%=rs.getDouble("total")%></td>
    <td><%=rs.getString("address")%></td>
    <td><%=rs.getString("city")%></td>
    <td><%=rs.getString("state")%></td>
    <td><%=rs.getString("country")%></td>
    <td><%=rs.getString("orderDate")%></td>
    <td><%=rs.getString("deliveryDate")%></td>
    <td><%=rs.getString("paymentMethod")%></td>
    <td><%=rs.getString("status")%></td>

    <!-- Cancel Order -->
   <td>
    <a href="cencelOrdersAction.jsp?id=<%=rs.getInt("id")%>&email=<%=rs.getString("email")%>&status=cancelled">
        <button class="cancel">Cancel</button>
    </a>
</td>
    <!-- Delivered -->
   <td>
    <a href="deliveredOrdersAction.jsp?id=<%=rs.getInt("id")%>&email=<%=rs.getString("email")%>&status=delivered">
        <button class="delivered">delivered</button>
    </a>
</td>
</tr>

<%
    }
}catch(Exception e){
    out.println(e);
}finally{
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>

</table>

</body>
</html>