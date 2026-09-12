<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up | ShopNow</title>

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
    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    display:grid;
    place-items:center;
    padding:40px 20px;
}

/* Main Card */
.container{
    width:100%;
    max-width:950px;
    background:rgba(255,255,255,0.06);
    padding:45px 40px;
    border-radius:22px;
    backdrop-filter:blur(15px);
    box-shadow:0 15px 45px rgba(0,0,0,0.7);
    animation:fadeIn .6s ease;
    color:white;
}

@keyframes fadeIn{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}

/* Logo */
.logo{
    text-align:center;
    font-size:36px;
    font-weight:700;
    margin-bottom:5px;
}

.logo span{
    color:#ffc107;
}

.title{
    text-align:center;
    font-size:22px;
    font-weight:500;
    margin-bottom:30px;
    color:#ddd;
}

/* Alert */
.alert{
    padding:12px;
    border-radius:10px;
    text-align:center;
    font-weight:600;
    margin-bottom:20px;
}

/* Grid */
.form-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:22px;
}

/* Form Group */
.form-group{
    display:flex;
    flex-direction:column;
}

label{
    font-size:14px;
    margin-bottom:6px;
    color:#bbb;
}

input, textarea, select{
    padding:14px;
    border:none;
    border-bottom:2px solid #555;
    background:transparent;
    color:white;
    font-size:14px;
    outline:none;
    transition:.3s;
}

input:focus, textarea:focus, select:focus{
    border-color:#ffc107;
}

textarea{
    resize:none;
}

/* Security Question Black */
/*select{
    background:#000;
    color:#fff;
}*/

select option{
    background:#000;
    color:#fff;
}

/* Full width row */
.full{
    grid-column:1 / -1;
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
    transition:.3s;
}

button:hover{
    background:#ffb300;
    transform:scale(1.05);
}

/* Links */
.footer-links{
    margin-top:20px;
    text-align:center;
    font-size:14px;
}

.footer-links a{
    color:#ffc107;
    text-decoration:none;
}

.footer-links a:hover{
    text-decoration:underline;
}

/* Responsive */
@media(max-width:768px){
    .form-grid{
        grid-template-columns:1fr;
    }

    .container{
        padding:35px 25px;
    }
}
</style>
</head>

<body>

<%
String msg = request.getParameter("msg");
String type = request.getParameter("type");

String bg="#1b5e20", border="#4caf50", text="#ffffff";

if("error".equals(type)){
    bg="#7f0000"; border="#ff5252"; text="#ffffff";
}
%>

<div class="container">

    <div class="logo">Shop<span>Now</span></div>
    <div class="title">Create Your Account 🚀</div>

    <% if(msg != null){ %>
        <div class="alert" style="background:<%=bg%>; border-left:5px solid <%=border%>; color:<%=text%>;">
            <%= msg %>
        </div>
    <% } %>

    <form action="Signup.jsp" method="post">

        <div class="form-grid">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" required>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>

            <div class="form-group">
                <label>Mobile Number</label>
                <input type="tel" name="mobile" required>
            </div>

            <div class="form-group">
                <label>City</label>
                <input type="text" name="city" required>
            </div>

            <div class="form-group">
                <label>Security Question</label>
                <select name="securityQuestion" required>
                    <option value="" disabled selected>Select question</option>
                    <option>What is your favourite color?</option>
                    <option>What is your pet name?</option>
                    <option>What is your mother's name?</option>
                    <option>Which city were you born in?</option>
                </select>
            </div>

            <div class="form-group">
                <label>Answer</label>
                <input type="text" name="answer" required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>

            <div class="form-group full">
                <label>Address</label>
                <textarea name="address" rows="3" required></textarea>
            </div>

            <div class="form-group full">
                <button type="submit">Create Account</button>
            </div>

        </div>

    </form>

    <div class="footer-links">
        <a href="Login.jsp">Already have an account? Login</a>
    </div>

</div>

</body>
</html>