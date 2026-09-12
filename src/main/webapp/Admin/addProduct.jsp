<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.* , Project1.DBconnection" %>
<%@ include file="adminHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>
    body{
        font-family: 'Poppins', sans-serif;
        background: #f3f4f6;
        margin: 0;
        padding: 0;
    }

    h2{
        text-align: center;
        color: #4f46e5;
        margin-top: 30px;
        font-size: 28px;
        letter-spacing: 1px;
    }

    .container{
        max-width: 950px;
        background: #ffffff;
        margin: 30px auto 60px auto;
        padding: 30px 40px;
        border-radius: 18px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        display: flex;
        gap: 40px;
        flex-wrap: wrap;
    }

    .left, .right{
        flex: 1;
        min-width: 300px;
    }

    label{
        font-weight: 500;
        font-size: 14px;
        display: block;
        margin-bottom: 6px;
        color: #333;
    }

    input[type="text"],
    input[type="number"],
    select,
    input[type="file"]{
        width: 100%;
        padding: 12px 10px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-size: 14px;
        transition: 0.2s;
    }

    input[type="text"]:focus,
    input[type="number"]:focus,
    select:focus,
    input[type="file"]:focus{
        border-color: #4f46e5;
        outline: none;
    }

    .btn{
        width: 100%;
        padding: 14px;
        background: #4f46e5;
        border: none;
        color: white;
        font-size: 16px;
        font-weight: 500;
        border-radius: 10px;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 10px;
    }

    .btn:hover{
        background: #4338ca;
    }

    .img-box{
        width: 100%;
        height: 300px;
        background: #f3f4f6;
        border: 2px dashed #bbb;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #777;
        font-size: 16px;
        position: relative;
    }

    .img-box img{
        max-width: 100%;
        max-height: 100%;
        border-radius: 10px;
        object-fit: contain;
    }

    .msg{
        max-width: 950px;
        margin: 20px auto;
        padding: 15px;
        text-align: center;
        font-weight: 500;
        border-radius: 10px;
        font-size: 16px;
        letter-spacing: 0.5px;
    }

    .success{ background: #22c55e; color: white; }
    .error{ background: #ef4444; color: white; }

    @media(max-width:900px){
        .container{
            flex-direction: column;
        }
    }
</style>

<script>
function previewImage(event){
    var img = document.getElementById("preview");
    img.src = URL.createObjectURL(event.target.files[0]);
    img.style.display = "block";
    document.getElementById("placeholder").style.display="none";
}
</script>

</head>
<body>

<%
int id = 1;
try {
    Connection con = DBconnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select max(id) from product");
    if(rs.next()) id = rs.getInt(1) + 1;
} catch(Exception e) { out.println("Error: " + e); }

// Display backend message
String msg = request.getParameter("msg");
String type = request.getParameter("type");
if(msg != null && !msg.isEmpty()){
%>
    <div class="msg <%= ("success".equals(type) ? "success" : "error") %>">
        <%= msg %>
    </div>
<%
}
%>

<h2>Add New Product</h2>

<div class="container">

    <!-- LEFT FORM -->
    <div class="left">
<form action="<%=request.getContextPath()%>/addProductAction" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= id %>">

            <label>Product ID</label>
            <input type="text" name="id" value="<%= id %>" readonly>

            <label>Product Name</label>
            <input type="text" name="pname" placeholder="Enter product name" required>

            <label>Category</label>
            <select name="category" required>
                <option value="">-- Select Category --</option>
                <option value="Electronics">Electronics</option>
                <option value="Mobile">Mobile</option>
                <option value="Clothes">Clothes</option>
                <option value="Home">Home</option>
                <option value="Shoes">Shoes</option>
            </select>

            <label>Price (₹)</label>
            <input type="number" name="price" placeholder="Enter price" required>

            <label>Active</label>
            <select name="active" required>
                <option value="Yes">Yes</option>
                <option value="No">No</option>
            </select>

            <label>Product Image</label>
            <input type="file" name="image" accept="image/*" onchange="previewImage(event)" required>

            <button class="btn" type="submit">Add Product</button>
        </form>
    </div>

    <!-- RIGHT IMAGE PREVIEW -->
    <div class="right">
        <div class="img-box">
            <img id="preview" style="display:none;">
            <span id="placeholder">Image Preview</span>
        </div>
    </div>

</div>

</body>
</html>
