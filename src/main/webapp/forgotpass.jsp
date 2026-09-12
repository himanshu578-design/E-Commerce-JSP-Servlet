<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recover Password | ShopNow</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
/* Security Question Fix */
select{
    background-color:#000;   /* black background */
    color:#fff;              /* white text */
    border-bottom:2px solid #555;
}

select option{
    background-color:#000;   /* dropdown options black */
    color:#fff;              /* option text white */
}


*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins', sans-serif;
}

body{
    min-height:100vh;
    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    display:grid;
    place-items:center;   /* Perfect center for laptop */
    padding:40px 20px;
}

/* Glass Card */
.container{
    width:100%;
    max-width:480px;
    background:rgba(255,255,255,0.06);
    padding:45px 35px;
    border-radius:22px;
    backdrop-filter:blur(15px);
    box-shadow:0 15px 45px rgba(0,0,0,0.7);
    animation:fadeIn 0.6s ease;
    color:white;
}

@keyframes fadeIn{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}

/* Logo */
.logo{
    font-size:36px;
    font-weight:700;
    text-align:center;
    margin-bottom:10px;
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
input, select{
    width:100%;
    padding:14px;
    margin-bottom:22px;
    border:none;
    border-bottom:2px solid #555;
    background:transparent;
    color:white;
    font-size:14px;
    outline:none;
    transition:0.3s;
}

input:focus, select:focus{
    border-color:#ffc107;
}

/* Button */
button{
    width:100%;
    padding:15px;
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

/* Small screens */
@media(max-width:480px){
    .container{
        padding:35px 22px;
    }
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
    <h2 class="title">Recover Your Password 🔐</h2>

    <% if(msg != null){ %>
        <div class="alert" style="background:<%= bg %>; border-left:5px solid <%= border %>; color:<%= text %>;">
            <%= msg %>
        </div>
    <% } %>

    <form action="forgotpassAction.jsp" method="post">

        <label>Email</label>
        <input type="email" name="email" placeholder="Enter registered email" required>

        <label>Phone Number</label>
        <input type="tel" name="mobile" placeholder="Enter registered phone number" required>

        <label>Security Question</label>
        <select name="securityQuestion" required>
            <option value="" disabled selected>Select your security question</option>
            <option>What is your favourite color?</option>
            <option>What is your pet name?</option>
            <option>What is your mother's name?</option>
            <option>Which city were you born in?</option>
        </select>

        <label>Answer</label>
        <input type="text" name="answer" placeholder="Enter your answer" required>

        <label>New Password</label>
        <input type="password" name="newPassword" placeholder="Enter new password" required>

        <button type="submit">Reset Password</button>

    </form>

    <div class="footer-links">
        <a href="Login.jsp">Back to Login</a>
        <a href="Signup.jsp">Don't have an account? Sign Up</a>
    </div>

</div>

</body>
</html>