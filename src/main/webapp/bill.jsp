<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection, java.text.SimpleDateFormat, java.util.Date" %>
<%@include file="header.jsp" %>

<%

    String email = (String) session.getAttribute("email");
    if(email == null){
        response.sendRedirect("Login.jsp");
        return;
    }

    int grandTotal = 0;
    String address = "", city = "", state = "", country = "", mobile = "", payment = "", transactionId = "";
    Date orderDate = null, deliveryDate = null;

    try{
        Connection con = DBconnection.getConnection();

        // Fetch last order details
        PreparedStatement psUser = con.prepareStatement(
            "SELECT address, city, state, country, mobileNumber, paymentMethod, transactionId, orderDate, deliveryDate " +
            "FROM cart WHERE email=? ORDER BY orderDate DESC LIMIT 1"
        );
        psUser.setString(1, email);
        ResultSet rs = psUser.executeQuery();

        if(rs.next()){
            address = rs.getString("address");
            city = rs.getString("city");
            state = rs.getString("state");
            country = rs.getString("country");
            mobile = rs.getString("mobileNumber");
            payment = rs.getString("paymentMethod");
            transactionId = rs.getString("transactionId");
            orderDate = rs.getTimestamp("orderDate");
            deliveryDate = rs.getTimestamp("deliveryDate");
        }
        rs.close();
        psUser.close();
%>

<div class="invoice-container">

    <div class="invoice-header">
        <h2>🧾 Invoice</h2>
        <div class="invoice-details">
            Order Date: <%= orderDate != null ? new SimpleDateFormat("dd MMM yyyy").format(orderDate) : "-" %><br>
            Delivery Date: <%= deliveryDate != null ? new SimpleDateFormat("dd MMM yyyy").format(deliveryDate) : "-" %><br>
            Payment: <%= payment %><br>
            Transaction ID: <%= transactionId == null ? "-" : transactionId %>
        </div>
    </div>

    <hr>

    <table>
        <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Total</th>
        </tr>

<%
        // Fetch products in the cart with status='bill'
        PreparedStatement ps = con.prepareStatement(
            "SELECT c.quantity, p.name, p.price, (p.price*c.quantity) AS item_total " +
            "FROM cart c INNER JOIN product p ON c.product_id=p.id " +
            "WHERE c.email=? AND c.status='bill'"
        );
        ps.setString(1, email);
        ResultSet rs1 = ps.executeQuery();

        while(rs1.next()){
            int itemTotal = rs1.getInt("item_total");
            grandTotal += itemTotal;
%>
        <tr>
            <td><%= rs1.getString("name") %></td>
            <td>₹ <%= rs1.getInt("price") %></td>
            <td><%= rs1.getInt("quantity") %></td>
            <td>₹ <%= itemTotal %></td>
        </tr>
<%
        }
        rs1.close();
        ps.close();

        session.setAttribute("grandTotal", grandTotal);
%>
        <tr class="total-row">
            <td colspan="3" align="right">Grand Total</td>
            <td>₹ <%= grandTotal %></td>
        </tr>
    </table>

    <div class="address-box">
        <b>Shipping Address:</b><br>
        <%= address %>, <%= city %>, <%= state %><br>
        <%= country %> | Mobile: <%= mobile %>
    </div>

    <!-- Buttons -->
    <div class="invoice-buttons">
        <a href="continueShopping.jsp" class="btn btn-continue">Continue Shopping</a>
        <button onclick="window.print()" class="btn btn-print">Print Invoice</button>
    </div>

</div>

<%
        con.close();
    } catch(Exception e){
        e.printStackTrace();
        out.println("ERROR : " + e);
    }
%>

<style>
.invoice-container{
    max-width:800px;
    margin:30px auto;
    padding:25px;
    border:1px solid #ccc;
    border-radius:10px;
    font-family:'Segoe UI',sans-serif;
    background:#f9f9f9;
}
.invoice-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
}
.invoice-header h2{
    margin:0;
}
.invoice-details{
    text-align:right;
    font-size:14px;
}
table{
    width:100%;
    border-collapse:collapse;
    margin-top:15px;
}
th, td{
    padding:10px;
    text-align:left;
    border:1px solid #ddd;
}
th{
    background:#0f172a;
    color:#fff;
}
.total-row{
    background:#e2e8f0;
    font-weight:bold;
}
.address-box{
    margin-top:20px;
    background:#0f172a;
    color:#fff;
    padding:15px;
    border-radius:8px;
}

/* Buttons */
.invoice-buttons {
    margin-top: 20px;
    display: flex;
    gap: 15px;
}

/* Common button style */
.btn {
    padding: 10px 18px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    text-decoration: none;
    cursor: pointer;
    border: none;
    transition: 0.3s;
}

/* Continue Shopping Button */
.btn-continue {
    background: linear-gradient(135deg, #2563eb, #1e40af);
    color: #fff;
}
.btn-continue:hover {
    transform: scale(1.05);
    box-shadow: 0 5px 15px rgba(37, 99, 235, 0.4);
}

/* Print Button */
.btn-print {
    background: linear-gradient(135deg, #22c55e, #16a34a);
    color: #fff;
}
.btn-print:hover {
    transform: scale(1.05);
    box-shadow: 0 5px 15px rgba(34, 197, 94, 0.4);
}

/* Hide buttons in print mode */
@media print {
    .invoice-buttons { display: none; }
}
</style>

<%@include file="footer.jsp" %>
