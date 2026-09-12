<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* , Project1.DBconnection" %>
<%@include file="header.jsp" %>

<!-- ================= CSS ================= -->
<style>
body{
  font-family:'Segoe UI',sans-serif;
  background:#0f1115;
  color:#e5e7eb;
  margin:0;
}

.container{
  max-width:1200px;
  margin:30px auto;
  padding:0 20px;
}

.page-title{
  font-size:26px;
  font-weight:700;
  margin-bottom:25px;
  color:#fff;
}

.product-grid{
  display:grid;
  grid-template-columns:repeat(auto-fill,minmax(230px,1fr));
  gap:22px;
}

.product-card{
  background:#111827;
  border-radius:16px;
  border:1px solid #1f2937;
  overflow:hidden;
  box-shadow:0 15px 30px rgba(0,0,0,.5);
}

.product-img{
  height:160px;
  background:#020617;
  display:flex;
  align-items:center;
  justify-content:center;
}

.product-img img{
  max-width:100%;
  max-height:100%;
  object-fit:contain;
}

.product-info{
  padding:14px;
}

.product-info h3{
  font-size:15px;
  margin-bottom:6px;
  color:#f9fafb;
}

.price{
  font-size:16px;
  font-weight:700;
  color:#22c55e;
  margin-bottom:10px;
}

.qty-box{
  display:flex;
  justify-content:space-between;
  margin-bottom:10px;
  font-size:13px;
}

.qty-box input{
  width:55px;
  padding:6px;
  border-radius:6px;
  background:#020617;
  border:1px solid #1f2937;
  color:#fff;
}

.actions{
  display:flex;
  gap:10px;
}

.actions button,
.actions a{
  flex:1;
  padding:9px;
  border-radius:8px;
  border:none;
  font-size:13px;
  cursor:pointer;
  font-weight:600;
  text-align:center;
}

.cart-btn{
  background:#2563eb;
  color:#fff;
}

.view-btn{
  background:#020617;
  color:#e5e7eb;
  border:1px solid #1f2937;
  text-decoration:none;
}

.no-data{
  color:#fff;
  font-size:18px;
}
</style>

<!-- ================= HTML + JSP ================= -->
<div class="container">
  <div class="page-title">Search Products</div>

  <div class="product-grid">
<%
String search = request.getParameter("search");
String category = request.getParameter("category");

try{
    Connection con = DBconnection.getConnection();
    PreparedStatement ps;

    if(search != null && !search.trim().equals("") && category != null && !category.equals("all")){
        ps = con.prepareStatement(
            "SELECT * FROM product WHERE active='yes' AND name LIKE ? AND category=?"
        );
        ps.setString(1, "%" + search + "%");
        ps.setString(2, category);
    }
    else if(search != null && !search.trim().equals("")){
        ps = con.prepareStatement(
            "SELECT * FROM product WHERE active='yes' AND name LIKE ?"
        );
        ps.setString(1, "%" + search + "%");
    }
    else if(category != null && !category.equals("all")){
        ps = con.prepareStatement(
            "SELECT * FROM product WHERE active='yes' AND category=?"
        );
        ps.setString(1, category);
    }
    else{
        ps = con.prepareStatement(
            "SELECT * FROM product WHERE active='yes'"
        );
    }

    ResultSet rs = ps.executeQuery();
    boolean found = false;

    while(rs.next()){
        found = true;
%>

    <!-- PRODUCT CARD -->
    <div class="product-card">
      <div class="product-img">
        <img src="Admin/showimg.jsp?id=<%=rs.getInt("id")%>">
      </div>

      <div class="product-info">
        <h3><%=rs.getString("name")%></h3>
        <div class="price">₹ <%=rs.getDouble("price")%></div>

        <form action="addToCartAction.jsp" method="post">
          <input type="hidden" name="pid" value="<%=rs.getInt("id")%>">

          <div class="qty-box">
            <label>Qty</label>
            <input type="number" name="qty" value="1" min="1">
          </div>

          <div class="actions">
            <button type="submit" class="cart-btn">Add to Cart</button>
            <a href="viewProduct.jsp?id=<%=rs.getInt("id")%>" class="view-btn">
              View
            </a>
          </div>
        </form>
      </div>
    </div>

<%
    }

    if(!found){
%>
    <div class="no-data">No products found</div>
<%
    }

}catch(Exception e){
    e.printStackTrace();
}
%>
  </div>
</div>

<%@include file="footer.jsp" %>
