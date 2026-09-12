<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | ShopNow</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins', sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    padding:20px;
}

/* Glass Card */
.container{
    width:100%;
    max-width:400px;
    background:rgba(255,255,255,0.05);
    padding:40px 30px;
    border-radius:18px;
    backdrop-filter:blur(15px);
    box-shadow:0 15px 40px rgba(0,0,0,0.6);
    animation:fadeIn 0.6s ease;
    color:white;
}

@keyframes fadeIn{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}

/* Logo */
.logo{
    font-size:34px;
    font-weight:700;
    text-align:center;
    margin-bottom:10px;
    letter-spacing:1px;
}

.logo span{
    color:#ffc107;
}

/* Title */
.title{
    text-align:center;
    font-size:22px;
    font-weight:500;
    margin-bottom:30px;
    color:#ddd;
}

/* Labels */
label{
    font-size:14px;
    margin-bottom:6px;
    display:block;
    color:#bbb;
}

/* Inputs */
input{
    width:100%;
    padding:13px;
    margin-bottom:22px;
    border:none;
    border-bottom:2px solid #555;
    background:transparent;
    color:white;
    font-size:14px;
    outline:none;
    transition:0.3s;
}

input:focus{
    border-color:#ffc107;
}

/* Password Eye */
.password-wrapper{
    position:relative;
}

.toggle-eye{
    position:absolute;
    right:10px;
    top:40%;
    transform:translateY(-50%);
    cursor:pointer;
    font-size:18px;
    color:#ffc107;
}

/* Button */
button{
    width:100%;
    padding:14px;
    background:#ffc107;
    border:none;
    color:black;
    font-size:16px;
    font-weight:600;
    border-radius:30px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#ffb300;
    transform:scale(1.05);
}

/* Alert */
.alert{
    padding:12px;
    border-radius:10px;
    text-align:center;
    font-weight:600;
    margin-bottom:18px;
}

/* Links */
.footer-links{
    margin-top:20px;
    text-align:center;
    font-size:14px;
}

.footer-links a{
    display:block;
    color:#ffc107;
    text-decoration:none;
    margin:6px 0;
    transition:0.3s;
}

.footer-links a:hover{
    text-decoration:underline;
}

@media(max-width:450px){
    .container{padding:30px 20px;}
}
</style>

</head>
<body>

<%
    String msg = request.getParameter("msg");
    String type = request.getParameter("type");

    String bg = "#1b5e20";
    String border = "#4caf50";
    String text = "#ffffff";

    if(type != null){
        if(type.equals("error")){
            bg = "#7f0000";
            border = "#ff5252";
            text = "#ffffff";
        } 
        else if(type.equals("warning")){
            bg = "#ff6f00";
            border = "#ffc107";
            text = "#000";
        }
    }
%>

<div class="container">
    <div class="logo">Shop<span>Now</span></div>
    <h2 class="title">Welcome Back 👋</h2>

    <% if(msg != null){ %>
        <div class="alert" style="background:<%= bg %>; border-left:5px solid <%= border %>; color:<%= text %>;">
            <%= msg %>
        </div>
    <% } %>

    <form action="loginAction.jsp" method="post">
        <label>Email</label>
        <input type="email" name="email" placeholder="Enter your email" required>

        <label>Password</label>
        <div class="password-wrapper">
            <input type="password" name="password" id="password" placeholder="Enter your password" required>
            <span class="toggle-eye" onclick="togglePassword()">👁</span>
        </div>

        <button type="submit">Login</button>
    </form>

    <div class="footer-links">
        <a href="Signup.jsp">Don't have an account? Sign Up</a>
        <a href="forgotpass.jsp">Forgot Password?</a>
    </div>
</div>

<script>
function togglePassword(){
    var p = document.getElementById('password');
    p.type = (p.type === 'password') ? 'text' : 'password';
}
</script>

</body>
</html>