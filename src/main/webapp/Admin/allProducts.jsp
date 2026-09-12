<%@page import="java.sql.* , Project1.DBconnection" %>
<%@ include file="adminHeader.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products</title>

<!-- BOOTSTRAP CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
    body {
        background: #f5f6fa;
        font-family: 'Poppins', sans-serif;
    }
    .table-container {
        margin: 30px auto;
        width: 90%;
        background: white;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    th {
        background: #4b7bec;
        color: white;
    }
    .edit-btn {
        padding: 6px 15px;
        border-radius: 8px;
    }
    .page-title {
        text-align: center;
        margin: 20px;
        font-size: 28px;
        font-weight: bold;
    }
    img {
        border-radius: 8px;
        object-fit: cover;
    }
</style>
</head>

<body>
<%
String msg = request.getParameter("msg");
if("deleted".equals(msg)){
%>
<div class="alert alert-success text-center">Product deleted successfully!</div>
<%
}
%>

<%
String msg1 = request.getParameter("msg1");

if ("updated".equals(msg1)) {
%>
<div class="alert alert-success text-center">
    Product updated successfully!
</div>
<%
} else if ("failed".equals(msg1)) {
%>
<div class="alert alert-danger text-center">
    Product update failed!
</div>
<%
}
%>

<h2 class="page-title">All Products</h2>

<div class="table-container">
<table class="table table-bordered table-hover text-center align-middle">
    <thead>
        <tr>
            <th>ID</th>
            <th>Product</th>
            <th>Category</th>
            <th>Price</th>
            <th>Active</th>
            <th>Image</th>
            <th>Edit</th>
            <th>Delete</th>
            
        </tr>
    </thead>

    <tbody>
    <%
        try {
            Connection con = DBconnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM product");
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
    %>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("category") %></td>
            <td>₹ <%= rs.getString("price") %></td>
            <td><%= rs.getString("active") %></td>

            <td>
                <img src="showimg.jsp?id=<%= rs.getString("id") %>" width="70" height="70">
            </td>

            <td>
                <a href="editProduct.jsp?id=<%= rs.getString("id") %>" 
                   class="btn btn-primary edit-btn">Edit</a>
            </td>
            
            <td>
<a href="${pageContext.request.contextPath}/deleteProduct?id=<%= rs.getString("id") %>" 
                   class="btn btn-primary edit-btn">Delete</a>
            </td>
        </tr>

    <%
            }
        } catch(Exception e) {
            out.print(e);
        }
    %>
    </tbody>

</table>
</div>

</body>
</html>
