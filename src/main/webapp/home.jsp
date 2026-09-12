<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.* , Project1.DBconnection" %>
<%@include file="header.jsp" %>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body{
  font-family:'Segoe UI',sans-serif;
  background:#0f1115;
  margin:0;
  padding:0;
  color:#e5e7eb;
}

/* CONTAINER */
.container{
  max-width:1200px;
  margin:30px auto;
  padding:0 20px;
}

/* PAGE TITLE */
.page-title{
  font-size:28px;
  font-weight:700;
  margin-bottom:25px;
  color:#f9fafb;
}

/* SEARCH BAR */
.search-bar{
  background:#020617;
  border:1px solid #1f2937;
  border-radius:16px;
  padding:12px 16px;
  display:flex;
  align-items:center;
  gap:12px;
  margin-bottom:30px;
  box-shadow:0 10px 30px rgba(0,0,0,.4);
}
.search-bar i{
  color:#94a3b8;
}
.search-bar input{
  flex:1;
  background:transparent;
  border:none;
  outline:none;
  color:#fff;
  font-size:15px;
}

/* CATEGORIES */
.categories{
  display:flex;
  gap:14px;
  flex-wrap:wrap;
  margin-bottom:35px;
}
.category-card{
  padding:10px 18px;
  border-radius:999px;
  background:#020617;
  border:1px solid #1f2937;
  color:#e5e7eb;
  font-size:14px;
  cursor:pointer;
}
.category-card:hover{
  background:linear-gradient(135deg,#2563eb,#1e40af);
  color:#fff;
}

/* GRID */
.product-grid{
  display:grid;
  grid-template-columns:repeat(auto-fill,minmax(230px,1fr));
  gap:22px;
}

/* PRODUCT CARD */
.product-card{
  background:#111827;
  border-radius:18px;
  overflow:hidden;
  border:1px solid #1f2937;
  box-shadow:0 15px 35px rgba(0,0,0,.6);
}

/* IMAGE */
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

/* INFO */
.product-info{
  padding:14px 15px;
}
.product-info h3{
  font-size:15px;
  font-weight:600;
  margin-bottom:6px;
  color:#f9fafb;
}

/* PRICE */
.price{
  font-size:16px;
  font-weight:700;
  color:#22c55e;
  margin-bottom:8px;
}

/* QTY */
.qty-box{
  display:flex;
  justify-content:space-between;
  margin-bottom:10px;
}
.qty-box input{
  width:55px;
  padding:6px;
  border-radius:8px;
  background:#020617;
  border:1px solid #1f2937;
  color:#fff;
}

/* BUTTONS */
.actions{
  display:flex;
  gap:10px;
}
.actions button,
.actions a{
  flex:1;
  padding:9px;
  border-radius:10px;
  font-size:13px;
  font-weight:600;
  border:none;
  cursor:pointer;
}

/* CART */
.cart-btn{
  background:linear-gradient(135deg,#2563eb,#1e40af);
  color:#fff;
}

/* VIEW */
.view-btn{
  background:#020617;
  border:1px solid #1f2937;
  color:#e5e7eb;
  text-align:center;
}

/* HERO IMAGE */
.hero-banner-img img{
  width:100%;
  max-height:360px;
  object-fit:cover;
  border-radius:0 0 20px 20px;
}

/* RESPONSIVE */
@media(max-width:768px){
  .product-grid{grid-template-columns:repeat(2,1fr);}
}
@media(max-width:480px){
  .product-grid{grid-template-columns:1fr;}
}

/* PRODUCT CARD HOVER */
.product-card{
  transition: transform .35s ease, box-shadow .35s ease;
}

.product-card:hover{
  transform: translateY(-10px) scale(1.03);
  box-shadow: 0 25px 50px rgba(37,99,235,.45);
}

/* IMAGE ZOOM */
.product-card:hover .product-img img{
  transform: scale(1.12);
}

.product-img img{
  transition: transform .35s ease;
}

/* BUTTON HOVER */
.product-card:hover .cart-btn{
  background: linear-gradient(135deg,#1d4ed8,#1e3a8a);
}

.product-card:hover .view-btn{
  background:#111827;
}

/* ===== ALERT MESSAGE ===== */
.alert{
  width:90%;
  max-width:520px;
  margin:20px auto;
  padding:14px 18px;
  border-radius:16px;
  display:flex;
  align-items:center;
  gap:12px;
  font-size:15px;
  font-weight:500;
  color:#fff;
  animation:slideDown .45s ease;
  box-shadow:0 15px 35px rgba(0,0,0,.6);
  position:relative;
  z-index:9999;
}

/* SUCCESS */
.alert.success{
  background:linear-gradient(135deg,#22c55e,#15803d);
}

/* WARNING */
.alert.warning{
  background:linear-gradient(135deg,#f59e0b,#b45309);
}

/* ERROR / LOGIN REQUIRED */
.alert.danger{
  background:linear-gradient(135deg,#ef4444,#991b1b);
}

/* ICON */
.alert i{
  font-size:20px;
}

/* ANIMATION */
@keyframes slideDown{
  from{
    opacity:0;
    transform:translateY(-18px);
  }
  to{
    opacity:1;
    transform:translateY(0);
  }
}

/* MOBILE RESPONSIVE */
@media(max-width:480px){
  .alert{
    font-size:14px;
    padding:12px 15px;
  }
}


</style>

<%
String msg = request.getParameter("msg");
if(msg != null){
%>
<div class="alert 
  <%= "added".equals(msg) ? "success" :
      "exist".equals(msg) ? "warning" : "danger" %>">

  <% if("loginRequired".equals(msg)){ %>
    <i class="fa-solid fa-lock"></i> Please login to add items to cart
  <% } else if("added".equals(msg)){ %>
    <i class="fa-solid fa-circle-check"></i> Product added to cart
  <% } else if("exist".equals(msg)){ %>
    <i class="fa-solid fa-circle-exclamation"></i> Quantity updated
  <% } else { %>
    <i class="fa-solid fa-triangle-exclamation"></i> Something went wrong
  <% } %>

</div>
<% } %>


<div class="hero-banner-img">
  <img src="image/2nd Banner.jpg">
</div>

<div class="container">
  <div class="page-title">Latest Products</div>

  <!-- SEARCH + CATEGORY FORM (NO JS) -->
  <form action="searchProducts.jsp" method="post">

    <div class="search-bar">
      <i class="fa-solid fa-magnifying-glass"></i>
      <input type="text" name="search" placeholder="Search products...">
    </div>

    <div class="categories">
      <button type="submit" name="category" value="all" class="category-card">All</button>
      <button type="submit" name="category" value="mobile" class="category-card">Mobiles</button>
      <button type="submit" name="category" value="laptop" class="category-card">Laptops</button>
      <button type="submit" name="category" value="fashion" class="category-card">HeadPhones</button>
      <button type="submit" name="category" value="electronics" class="category-card">Electronics</button>
    </div>

  </form>

  <!-- PRODUCTS -->
  <div class="product-grid">
  <%
    try{
      Connection con = DBconnection.getConnection();
      PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM product WHERE active='yes'"
      );
      ResultSet rs = ps.executeQuery();

      while(rs.next()){
  %>
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
            <button class="cart-btn" type="submit">
              <i class="fa fa-cart-plus"></i> Add
            </button>
            <a href="viewProduct.jsp?id=<%=rs.getInt("id")%>" class="view-btn">View</a>
          </div>
        </form>
      </div>
    </div>
  <%
      }
    }catch(Exception e){
      e.printStackTrace();
    }
  %>
  </div>
</div>

<%@include file="footer.jsp" %>
