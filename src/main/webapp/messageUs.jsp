<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection" %>

<%
String success="";

if("POST".equalsIgnoreCase(request.getMethod())){
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String message=request.getParameter("message");

    try{
        Connection con=DBconnection.getConnection();
        PreparedStatement ps=con.prepareStatement(
            "INSERT INTO contact_messages(name,email,message) VALUES(?,?,?)"
        );
        ps.setString(1,name);
        ps.setString(2,email);
        ps.setString(3,message);
        ps.executeUpdate();
        success="Message sent successfully!";
    }catch(Exception e){
        out.println(e);
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Message Us</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
body{
    margin:0;
    font-family:'Poppins',sans-serif;
    background:linear-gradient(135deg,#020617,#020617,#030712);
    color:#fff;
}

/* Content area */
.main{
    min-height:calc(100vh - 120px);
    display:flex;
    justify-content:center;
    align-items:center;
}

/* Card */
.card{
    width:420px;
    background:rgba(15,23,42,0.9);
    border-radius:20px;
    padding:32px;
    box-shadow:0 0 40px rgba(0,0,0,0.7);
}

.card h2{
    text-align:center;
    margin-bottom:25px;
    font-weight:500;
}

/* Inputs */
input,textarea{
    width:100%;
    padding:13px;
    margin-bottom:16px;
    border-radius:12px;
    border:1px solid #1f2937;
    background:#020617;
    color:#fff;
    outline:none;
}

input::placeholder,
textarea::placeholder{
    color:#6b7280;
}

/* Button */
button{
    width:100%;
    padding:13px;
    border:none;
    border-radius:30px;
    background:linear-gradient(135deg,#2563eb,#4f46e5);
    color:#fff;
    font-size:15px;
    cursor:pointer;
}

button:hover{
    opacity:0.9;
}

/* Toast */
.toast{
    position:fixed;
    right:25px;
    bottom:80px;
    background:#16a34a;
    padding:14px 22px;
    border-radius:12px;
    font-size:14px;
    box-shadow:0 10px 30px rgba(0,0,0,0.6);
}
</style>
</head>

<body>

<jsp:include page="header.jsp"/>

<div class="main">
    <div class="card">
        <h2>📩 Message Us</h2>

        <form method="post">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <textarea name="message" placeholder="Your Message..." required></textarea>
            <button>Send Message</button>
        </form>
    </div>
</div>

<% if(!success.equals("")){ %>
<div class="toast"><%= success %></div>
<% } %>

<jsp:include page="footer.jsp"/>

</body>
</html>
