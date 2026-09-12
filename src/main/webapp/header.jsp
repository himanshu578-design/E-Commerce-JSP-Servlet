<!-- Responsive Modern Header for E-commerce Website -->

<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
/* Reset */
*{margin:0;padding:0;box-sizing:border-box;font-family:'Segoe UI',sans-serif;}

header{
  width:100%;
  background:linear-gradient(135deg,#1f2933,#111827);
  color:#fff;
}

.navbar{
  max-width:1200px;
  margin:auto;
  padding:14px 20px;
  display:flex;
  align-items:center;
  justify-content:space-between;
}

.logo{
  font-size:22px;
  font-weight:700;
  letter-spacing:1px;
}

.logo span{color:#38bdf8;}

.nav-links{
  display:flex;
  align-items:center;
  gap:22px;
}

.nav-links a{
  color:#e5e7eb;
  text-decoration:none;
  font-size:15px;
  display:flex;
  align-items:center;
  gap:6px;
  transition:0.3s;
}

.nav-links a:hover{
  color:#38bdf8;
}

.user-box{
  display:flex;
  align-items:center;
  gap:10px;
  background:#1f2937;
  padding:6px 12px;
  border-radius:30px;
}

.user-box i{
  font-size:18px;
  color:#38bdf8;
}

.user-email{
  font-size:13px;
  color:#d1d5db;
}

/* NEW LOGIN BUTTON */
.login-btn{
  background:#22c55e;
  padding:7px 14px;
  border-radius:20px;
  color:#fff !important;
  font-size:14px;
}
.login-btn:hover{
  background:#16a34a;
}

.logout-btn{
  background:#ef4444;
  padding:7px 14px;
  border-radius:20px;
  color:#fff !important;
  font-size:14px;
}

.logout-btn:hover{
  background:#dc2626;
}

.menu-toggle{
  display:none;
  font-size:22px;
  cursor:pointer;
}

/* Responsive */
@media(max-width:900px){
  .nav-links{
    position:absolute;
    top:65px;
    left:0;
    width:100%;
    background:#111827;
    flex-direction:column;
    gap:16px;
    padding:20px 0;
    display:none;
  }
  .nav-links.active{display:flex;}
  .menu-toggle{display:block;}
}
</style>

<header>
  <div class="navbar">

    <!-- Logo -->
    <div class="logo">Shop<span>Now</span></div>

    <!-- Menu Toggle -->
    <div class="menu-toggle" onclick="toggleMenu()">
      <i class="fas fa-bars"></i>
    </div>

    <!-- Nav Links -->
    <div class="nav-links" id="navLinks">

      <a href="home.jsp"><i class="fas fa-home"></i> Home</a>
      <a href="myCart.jsp"><i class="fas fa-shopping-cart"></i> My Cart</a>
      <a href="myOrder.jsp"><i class="fas fa-box"></i> My Orders</a>
      <a href="messageUs.jsp"><i class="fas fa-envelope"></i> Message Us</a>
      <a href="aboutUs.jsp"><i class="fas fa-circle-info"></i> About</a>

      <!-- User Info -->
      <div class="user-box">
        <i class="fas fa-user-circle"></i> 
        <span class="user-email"><%=session.getAttribute("email")%></span>
      </div>

<%if(session.getAttribute("email")==null)
{%>
      <!-- Login -->
      <a href="Login.jsp" class="login-btn">
        <i class="fas fa-right-to-bracket"></i> Login
      </a>
<%}else{ %>

      <!-- Logout -->
      <a href="Login.jsp" class="logout-btn">
        <i class="fas fa-right-from-bracket"></i> Logout
      </a>
<%} %>
    </div>
  </div>
</header>

<script>
function toggleMenu(){
  document.getElementById('navLinks').classList.toggle('active');
}
</script>