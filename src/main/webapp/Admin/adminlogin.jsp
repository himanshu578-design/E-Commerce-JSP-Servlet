<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #4f46e5, #9333ea);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #ffffff;
            width: 380px;
            padding: 30px 35px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            animation: fadeIn 0.6s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            color: #333;
        }
        label {
            font-size: 14px;
            font-weight: 500;
            color: #555;
        }
        .input-box {
            width: 100%;
            margin: 8px 0 18px 0;
        }
        .input-box input {
            width: 100%;
            padding: 12px 14px;
            font-size: 14px;
            border-radius: 10px;
            border: 1px solid #ccc;
            outline: none;
            transition: 0.3s;
        }
        .input-box input:focus {
            border-color: #6366f1;
            box-shadow: 0 0 4px rgba(99, 102, 241, 0.6);
        }
        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 10px;
            background: #4f46e5;
            color: #fff;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background: #4338ca;
        }
        .footer-text {
            margin-top: 15px;
            text-align: center;
            font-size: 13px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>
        <% String msg = request.getParameter("msg"); %>

        <form action="adminloginAction.jsp" method="post">
            <label>Email</label>
            <div class="input-box">
                <input type="email" name="email" placeholder="Enter admin email" required />
            </div>

            <label>Password</label>
            <div class="input-box">
                <input type="password" name="password" placeholder="Enter password" required />
            </div>

            <button type="submit">Login</button>
        </form>

            <!-- Success Message -->
            <div style="margin-top: 15px; text-align:center; color: green; font-weight: 500; font-size: 14px;">
                <% if(request.getParameter("msg") != null) { %>
                    <%= request.getParameter("msg") %>
                <% } %>
            </div>

        <div class="footer-text">E-Commerce Admin Panel</div>
    </div>
</body>
</html>
