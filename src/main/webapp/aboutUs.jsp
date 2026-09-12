<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>

<style>
body{
  font-family:'Segoe UI',sans-serif;
  background:#0f1115;
  color:#e5e7eb;
}

.container{
  max-width:1100px;
  margin:40px auto;
  padding:20px;
}

.hero{
  background:linear-gradient(135deg,#1e3a8a,#020617);
  border-radius:20px;
  padding:40px;
  text-align:center;
  box-shadow:0 15px 40px rgba(0,0,0,0.4);
}

.hero h1{
  font-size:36px;
  margin-bottom:10px;
}

.hero p{
  font-size:16px;
  color:#c7d2fe;
}

.section{
  margin-top:40px;
  display:grid;
  grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
  gap:25px;
}

.card{
  background:#111827;
  padding:25px;
  border-radius:18px;
  border:1px solid #1f2937;
  transition:0.3s;
}

.card:hover{
  transform:translateY(-8px);
  box-shadow:0 20px 40px rgba(37,99,235,0.25);
}

.card h3{
  margin-bottom:10px;
  color:#93c5fd;
}

.card p{
  font-size:14px;
  color:#d1d5db;
  line-height:1.6;
}

.values{
  margin-top:50px;
  text-align:center;
}

.values h2{
  font-size:28px;
  margin-bottom:20px;
}

.value-list{
  display:flex;
  flex-wrap:wrap;
  justify-content:center;
  gap:20px;
}

.value{
  background:#020617;
  padding:18px 25px;
  border-radius:30px;
  border:1px solid #1f2937;
  font-size:14px;
  color:#93c5fd;
}

.footer-note{
  margin-top:50px;
  text-align:center;
  font-size:14px;
  color:#9ca3af;
}

@media(max-width:768px){
  .hero h1{font-size:28px;}
}
</style>

</head>
<body>

<div class="container">

  <!-- HERO -->
  <div class="hero">
    <h1>About Us</h1>
    <p>Building simple, reliable & modern shopping experiences</p>
  </div>

  <!-- INFO SECTION -->
  <div class="section">
    <div class="card">
      <h3>Who We Are</h3>
      <p>
        We are a passionate team focused on creating modern and user-friendly
        e-commerce solutions. Our goal is to provide a smooth and secure shopping
        experience for everyone.
      </p>
    </div>

    <div class="card">
      <h3>What We Do</h3>
      <p>
        From product browsing to secure checkout, we design every feature
        carefully. We combine clean UI, strong backend logic, and reliable
        databases.
      </p>
    </div>

    <div class="card">
      <h3>Why Choose Us</h3>
      <p>
        Fast performance, clean design, and customer satisfaction are our top
        priorities. We continuously improve our platform based on user feedback.
      </p>
    </div>
  </div>

  <!-- VALUES -->
  <div class="values">
    <h2>Our Core Values</h2>
    <div class="value-list">
      <div class="value">🚀 Innovation</div>
      <div class="value">🔒 Security</div>
      <div class="value">❤️ Customer First</div>
      <div class="value">⚡ Performance</div>
      <div class="value">🌍 Transparency</div>
    </div>
  </div>

  <!-- FOOTER NOTE -->
  <div class="footer-note">
    © 2025 Your Store. All rights reserved.
  </div>

</div>

</body>
</html>

<%@include file="footer.jsp" %>
