<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Header</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <script src="https://unpkg.com/lucide@latest"></script>

    <style>
        body{
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f3f4f6;
        }

        .admin-header{
            position: sticky;
            top: 0;
            z-index: 100;
            width: 100%;
            background: linear-gradient(135deg, #4f46e5, #9333ea);
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            box-sizing: border-box;
            gap: 15px;
        }

        .logo{
            font-size: 20px;
            font-weight: 600;
            color: #fff;
            display: flex;
            align-items: center;
            gap: 8px;
            white-space: nowrap;
        }

        .nav-links{
            display: flex;
            gap: 12px;
            align-items: center;
            flex: 1;
            justify-content: center;
            overflow-x: auto;
            scrollbar-width: none;
        }

        .nav-links::-webkit-scrollbar{
            display: none;
        }

        .nav-links a{
            text-decoration: none;
            color: #fff;
            font-size: 14px;
            font-weight: 500;
            padding: 6px 10px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: 0.3s;
            white-space: nowrap;
        }

        .nav-links a:hover{
            background: rgba(255,255,255,0.25);
        }

        .logout{
            background: #ef4444;
            border-radius: 8px;
            padding: 6px 12px;
            color: #fff;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
            white-space: nowrap;
        }

        .logout:hover{
            background: #dc2626;
        }

        @media (max-width: 900px){
            .nav-links{
                overflow-x: auto;
            }
        }
    </style>
</head>

<body>

<header class="admin-header">
    <div class="logo">
        <i data-lucide="layout-dashboard"></i> Admin Panel
    </div>

    <nav class="nav-links">
        <a href="addProduct.jsp"><i data-lucide="plus"></i> Add Product</a>
        <a href="allProducts.jsp"><i data-lucide="shopping-bag"></i> All Products</a>
        <a href="messageReceive.jsp"><i data-lucide="mail"></i> Message Received</a>
        <a href="Recieved-Order.jsp"><i data-lucide="package"></i> Order Received</a>
        <a href=""><i data-lucide="x"></i> Cancel Orders</a>
        <a href=""><i data-lucide="check"></i> Delivered Orders</a>
    </nav>

    <a href="logout.jsp" class="logout">
        <i data-lucide="log-out"></i> Logout
    </a>
</header>

<script>
    lucide.createIcons();
</script>

</body>
</html>