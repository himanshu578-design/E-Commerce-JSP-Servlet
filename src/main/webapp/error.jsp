<%@page isErrorPage="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- Admin Error Page (JSP) --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Error - Something Went Wrong</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #ef4444, #b91c1c);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        .box {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(8px);
            padding: 40px 50px;
            width: 420px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            animation: pop 0.4s ease;
        }

        @keyframes pop {
            from {
                transform: scale(0.85);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        h1 {
            font-size: 70px;
            font-weight: 700;
            margin: 0;
            color: #fff;
            letter-spacing: 2px;
        }

        .msg {
            font-size: 17px;
            margin-top: 10px;
            opacity: 0.95;
        }

        a.button {
            display: inline-block;
            margin-top: 25px;
            text-decoration: none;
            background: #fff;
            padding: 12px 20px;
            color: #b91c1c;
            font-weight: 600;
            border-radius: 10px;
            transition: 0.3s;
        }

        a.button:hover {
            background: #f3f3f3;
        }
    </style>
</head>
<body>

<%
    // Retrieve dynamic message (if provided) and sanitize basic HTML
    String msg = request.getParameter("msg");
    if(msg == null || msg.trim().isEmpty()){
        msg = "Something went wrong! Please try again later.";
    }
%>

    <div class="box">
        <h1>⚠️ Error</h1>
<div class="msg"><%= msg.replace("<","&lt;").replace(">","&gt;") %></div>
        <a href="Login.jsp" class="button">🔙 Go Back</a>
    </div>
</body>
</html>