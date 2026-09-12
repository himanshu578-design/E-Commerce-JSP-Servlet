<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection" %>

<%
    String sessionEmail = (String) session.getAttribute("email");
    if (sessionEmail == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String name="", email="", mobile="", city="", state="", address="", secQ="";

    try {
        Connection con = DBconnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT name, email, mobileNumber, city, state, address, securityQuestion FROM users WHERE email=?"
        );
        ps.setString(1, sessionEmail);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            mobile = rs.getString("mobileNumber");
            city = rs.getString("city");
            state = rs.getString("state");
            address = rs.getString("address");
            secQ = rs.getString("securityQuestion");
        }
    } catch(Exception e){
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>My Profile</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body{
    margin:0;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    font-family:'Poppins', sans-serif;
    background: linear-gradient(135deg,#141e30,#243b55);
}

.profile-card{
    width:460px;
    background:rgba(255,255,255,0.12);
    backdrop-filter: blur(18px);
    border-radius:22px;
    padding:35px;
    color:#fff;
    box-shadow:0 20px 50px rgba(0,0,0,0.45);
}

.avatar{
    width:90px;
    height:90px;
    background:linear-gradient(135deg,#ff512f,#dd2476);
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:40px;
    margin:0 auto 15px;
}

.profile-card h2{
    text-align:center;
    margin-bottom:25px;
    font-weight:600;
}

.profile-item{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:12px 0;
    border-bottom:1px solid rgba(255,255,255,0.2);
    font-size:14px;
}

.profile-item i{
    margin-right:8px;
    color:#ffb703;
}

.value{
    font-weight:500;
    text-align:right;
    max-width:230px;
}

.logout-btn{
    margin-top:28px;
    width:100%;
    padding:13px;
    border:none;
    border-radius:30px;
    font-size:15px;
    font-weight:500;
    cursor:pointer;
    background:linear-gradient(135deg,#ff512f,#dd2476);
    color:#fff;
    transition:0.3s;
}

.logout-btn:hover{
    transform:scale(1.06);
}
</style>
</head>

<body>

<div class="profile-card">

    <div class="avatar">
        <i class="fa-solid fa-user"></i>
    </div>

    <h2>My Profile</h2>

    <div class="profile-item">
        <span><i class="fa-solid fa-id-card"></i>Name</span>
        <span class="value"><%= name %></span>
    </div>

    <div class="profile-item">
        <span><i class="fa-solid fa-envelope"></i>Email</span>
        <span class="value"><%= email %></span>
    </div>

    <div class="profile-item">
        <span><i class="fa-solid fa-phone"></i>Mobile</span>
        <span class="value"><%= mobile %></span>
    </div>

    <div class="profile-item">
        <span><i class="fa-solid fa-city"></i>City</span>
        <span class="value"><%= city %>, <%= state %></span>
    </div>

    <div class="profile-item">
        <span><i class="fa-solid fa-location-dot"></i>Address</span>
        <span class="value"><%= address %></span>
    </div>

    <div class="profile-item">
        <span><i class="fa-solid fa-shield-halved"></i>Security Question</span>
        <span class="value"><%= secQ %></span>
    </div>

    <form action="Logout.jsp">
        <button class="logout-btn">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </button>
    </form>

</div>

</body>
</html>
