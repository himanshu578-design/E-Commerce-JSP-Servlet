<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Cart</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- CSS Styles -->
    <style>
        body {
            background: #0f172a;
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }

        .page-title {
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .msg {
            background: #022c22;
            color: #22c55e;
            padding: 14px 18px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .cart-box {
            background: #020617;
            border-radius: 18px;
            padding: 25px;
        }

        .cart-header, .cart-item {
            display: grid;
            grid-template-columns: 1fr 120px 250px 120px 120px;
            gap: 15px;
            align-items: center;
        }

        .cart-header {
            color: #94a3b8;
            border-bottom: 1px solid #1e293b;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }

        .cart-item {
            padding: 15px 0;
            border-bottom: 1px solid #1e293b;
        }

        /* Quantity container */
        .quantity-container {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .quantity-btn {
            width: 30px;
            height: 30px;
            border: none;
            background-color: #2563eb;
            color: #fff;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
        }

        .quantity-input {
            width: 50px;
            height: 30px;
            text-align: center;
            border-radius: 5px;
            border: 1px solid #ccc;
            color: #000;
        }

        /* Update button */
        .update-btn {
            background: #22c55e;
            padding: 6px 12px;
            border-radius: 6px;
            border: none;
            color: #fff;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s;
        }

        .update-btn:hover {
            background: #16a34a;
        }

        /* Cancel button */
        .remove-btn {
            background: #ef4444;
            color: #fff;
            padding: 6px 12px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            display: inline-block;
        }

        .remove-btn:hover {
            background: #dc2626;
        }

        /* Total box */
        .total-box {
            margin-top: 25px;
            display: flex;
            justify-content: flex-end;
            gap: 20px;
            align-items: center;
        }

        .checkout-btn {
            background: #22c55e;
            padding: 12px 25px;
            border-radius: 10px;
            color: #fff;
            text-decoration: none;
        }

        /* Empty cart */
        .empty-cart {
            text-align: center;
            padding: 50px;
            color: #94a3b8;
        }

        .shop-btn {
            background: #2563eb;
            padding: 12px 25px;
            border-radius: 10px;
            color: #fff;
            text-decoration: none;
        }
    </style>

    <script>
        function changeQuantity(inputId, type){
            var input = document.getElementById(inputId);
            var val = parseInt(input.value);
            if(type === 'increase') val++;
            if(type === 'decrease' && val > 1) val--;
            input.value = val;
        }
    </script>
</head>

<body>
<div class="container">

    <div class="page-title">My Cart</div>

    <%
        String msg = request.getParameter("msg");
        if("removed".equals(msg)){
    %>
        <div class="msg">Item cancelled successfully</div>
    <%
        } else if("updated".equals(msg)){
    %>
        <div class="msg">Quantity updated successfully</div>
    <%
        }
    %>

    <%
        String email = (String)session.getAttribute("email");
        int total = 0;

        if(email != null){
            Connection con = DBconnection.getConnection();

            // Total calculation
            PreparedStatement psTotal =
                con.prepareStatement("SELECT SUM(total) FROM cart WHERE email=? AND address IS NULL");
            psTotal.setString(1,email);
            ResultSet rsTotal = psTotal.executeQuery();
            if(rsTotal.next()){
                total = rsTotal.getInt(1);
            }

            // Cart items
            PreparedStatement psItems =
                con.prepareStatement(
                    "SELECT cart.product_id, cart.quantity, product.name, product.price " +
                    "FROM cart INNER JOIN product ON product.id = cart.product_id " +
                    "WHERE cart.email=? AND cart.address IS NULL"
                );
            psItems.setString(1,email);
            ResultSet rsItems = psItems.executeQuery();

            if(!rsItems.isBeforeFirst()){
    %>
                <div class="empty-cart">
                    Your cart is empty! <a href="home.jsp" class="shop-btn">Shop Now</a>
                </div>
    <%
            } else {
    %>
                <div class="cart-box">
                    <div class="cart-header">
                        <div>Product</div>
                        <div>Price</div>
                        <div>Quantity</div>
                        <div>Update</div>
                        <div>Cancel Order</div>
                    </div>
    <%
                while(rsItems.next()){
                    int productId = rsItems.getInt("product_id");
                    int quantity = rsItems.getInt("quantity");
    %>
                    <div class="cart-item">
                        <div><%=rsItems.getString("name")%></div>
                        <div>₹<%=rsItems.getInt("price")%></div>

                        <!-- Quantity container with stylish + / - -->
                        <div class="quantity-container">
                            <input type="text" id="qty<%=productId%>" value="<%=quantity%>" class="quantity-input" readonly>
                            <button type="button" class="quantity-btn" onclick="changeQuantity('qty<%=productId%>','decrease')">-</button>
                            <button type="button" class="quantity-btn" onclick="changeQuantity('qty<%=productId%>','increase')">+</button>
                        </div>

                        <!-- Update button -->
                        <div>
                            <form action="updateQuantity.jsp" method="post">
                                <input type="hidden" name="product_id" value="<%=productId%>">
                                <input type="hidden" name="quantity" id="hiddenQty<%=productId%>" value="<%=quantity%>">
                                <button type="submit" class="update-btn" onclick="document.getElementById('hiddenQty<%=productId%>').value=document.getElementById('qty<%=productId%>').value;">Update</button>
                            </form>
                        </div>

                        <!-- Cancel Order -->
                        <div>
                            <a href="removeFromCart.jsp?id=<%=productId%>" class="remove-btn">Cancel</a>
                        </div>
                    </div>
    <%
                } // while
    %>
                    <div class="total-box">
                        <strong>Total: ₹<%=total%></strong>
                        <a href="addressPaymentForOrder.jsp?" class="checkout-btn">Proceed</a>
                    </div>
                </div>
    <%
            }
        }
    %>

</div>
</body>
</html>
