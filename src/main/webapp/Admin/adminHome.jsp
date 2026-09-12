<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="adminHeader.jsp" %>


<style>
    .home-wrapper{
        min-height: calc(100vh - 90px);
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #667eea, #764ba2);
       
    }

    .welcome-card{
        background: #fff;
        padding: 50px;
        width: 420px;
        border-radius: 18px;
        text-align: center;
        box-shadow: 0 15px 40px rgba(0,0,0,0.25);
        animation: fadeIn 0.8s ease;
    }

    .welcome-card h1{
        font-size: 32px;
        margin-bottom: 10px;
        color: #333;
    }

    .welcome-card h1 span{
        color: #4f46e5;
    }

    .welcome-card p{
        font-size: 16px;
        color: #666;
    }

    @keyframes fadeIn{
        from{opacity:0; transform: translateY(20px);}
        to{opacity:1; transform: translateY(0);}
    }
</style>

<div class="home-wrapper">
    <div class="welcome-card">
        <h1>Hello <span>Admin</span> 👋</h1>
        <p>Welcome back! Manage products, orders and users from here.</p>
    </div>
</div>
<%@ include file="adminFooter.jsp" %>
