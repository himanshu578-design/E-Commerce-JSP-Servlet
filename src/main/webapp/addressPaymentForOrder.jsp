<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* , Project1.DBconnection" %>
<%@include file="header.jsp" %>

<%
String email = (String)session.getAttribute("email");
int grandTotal = 0;
%>

<!-- ================= CSS ONLY ================= -->
<style>
body{
  font-family:'Segoe UI',sans-serif;
  background:#0f1115;
  color:#e5e7eb;
}

.container{
  max-width:1100px;
  margin:30px auto;
  padding:20px;
}

.top-bar{
  display:flex;
  align-items:center;
  gap:15px;
  margin-bottom:25px;
}

.back-btn{
  padding:8px 14px;
  background:#020617;
  border:1px solid #1f2937;
  color:#fff;
  border-radius:8px;
  text-decoration:none;
}

.page-title{
  font-size:26px;
  font-weight:700;
}

.main-grid{
  display:grid;
  grid-template-columns:1fr 1fr;
  gap:30px;
}

.form-box,.cart-box{
  background:#111827;
  padding:20px;
  border-radius:16px;
  border:1px solid #1f2937;
}

.form-group{margin-bottom:12px;}
.form-group label{font-size:13px;color:#cbd5f5;}

.form-group input,
.form-group select,
.form-group textarea{
  width:100%;
  padding:10px;
  border-radius:8px;
  border:1px solid #1f2937;
  background:#020617;
  color:#fff;
  margin-top:5px;
}

textarea{resize:none}

.submit-btn{
  width:100%;
  padding:12px;
  margin-top:15px;
  background:linear-gradient(135deg,#2563eb,#1e40af);
  border:none;
  border-radius:10px;
  color:#fff;
  font-size:15px;
  cursor:pointer;
}

.cart-item{
  display:flex;
  justify-content:space-between;
  margin-bottom:12px;
  font-size:14px;
}

.total{
  border-top:1px solid #1f2937;
  padding-top:12px;
  margin-top:12px;
  font-size:18px;
  font-weight:700;
  color:#22c55e;
}

.upi-box{
  margin-top:15px;
  background:#020617;
  padding:12px;
  border-radius:10px;
  border:1px dashed #2563eb;
  color:#93c5fd;
}

@media(max-width:768px){
  .main-grid{grid-template-columns:1fr;}
}
</style>

<script>
if(window.history.forward(1)!=null)
  window.history.forward(1);
</script>

<!-- ================= HTML ================= -->
<div class="container">

  <div class="top-bar">
    <a href="myCart.jsp" class="back-btn">← Back</a>
    <div class="page-title">Checkout</div>
  </div>

  <div class="main-grid">

    <!-- ADDRESS -->
    <div class="form-box">
      <h3>Shipping Address & Payment</h3>

      <form action="addressPaymentForOrderAction.jsp" method="post">
        <input type="hidden" name="email" value="<%=email%>">

        <div class="form-group">
          <label>Full Address</label>
          <textarea name="address" rows="3" required></textarea>
        </div>

        <div class="form-group">
          <label>City</label>
          <input type="text" name="city" required>
        </div>

        <div class="form-group">
          <label>State</label>
          <input type="text" name="state" required>
        </div>

        <div class="form-group">
          <label>Country</label>
          <input type="text" name="country" value="India" required>
        </div>

        <div class="form-group">
          <label>Mobile Number</label>
          <input type="text" name="mobile" required>
        </div>

        <div class="form-group">
          <label>Payment Method</label>
          <select name="payment">
            <option value="COD">Cash on Delivery</option>
            <option value="UPI">UPI / Online Payment</option>
          </select>
        </div>

        <div class="form-group">
          <label>UPI ID</label>
          <input type="text" name="UPI_id">
        </div>

        <button type="submit" class="submit-btn">
          Place Order or billing
        </button>
      </form>

      <div class="upi-box">
        💳 Pay Online on <b>himanshu@pay.com</b>
      </div>
    </div>

    <!-- CART SUMMARY -->
    <div class="cart-box">
      <h3>Order Summary</h3>

      <div class="cart-item" style="font-weight:600;color:#93c5fd;">
        <span>Product</span>
        <span>Total</span>
      </div>

<%
try{
  Connection con = DBconnection.getConnection();
  PreparedStatement ps = con.prepareStatement(
    "SELECT c.quantity,p.name,p.price,(p.price*c.quantity) item_total " +
    "FROM cart c INNER JOIN product p ON c.product_id=p.id " +
    "WHERE c.email=? AND status='cart'"
  );
  ps.setString(1,email);
  ResultSet rs = ps.executeQuery();

  while(rs.next()){
    grandTotal += rs.getInt("item_total");
%>
      <div class="cart-item">
        <span>
          <%=rs.getString("name")%><br>
          <small>₹ <%=rs.getInt("price")%> × <%=rs.getInt("quantity")%></small>
        </span>
        <span>₹ <%=rs.getInt("item_total")%></span>
      </div>
<%
  }
}catch(Exception e){e.printStackTrace();}
session.setAttribute("grandTotal",grandTotal);
%>

      <div class="total">
        Grand Total : ₹ <%=grandTotal%>
      </div>
    </div>

  </div>
</div>

<%@include file="footer.jsp" %>
