<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection" %>
<%@ include file="adminHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
.card {
    margin: 40px auto;
    max-width: 600px;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}
</style>
</head>
<body>

<%
String id = request.getParameter("id");
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String name="", category="", price="", active="";

try {
    con = DBconnection.getConnection();
    ps = con.prepareStatement("SELECT * FROM product WHERE id=?");
    ps.setString(1, id);
    rs = ps.executeQuery();

    if(rs.next()) {
        name = rs.getString("name");
        category = rs.getString("category");
        price = rs.getString("price");
        active = rs.getString("active");
    }
} catch(Exception e) {
    out.print(e);
}
%>

<div class="card">
    <h3 class="text-center mb-3">Edit Product</h3>

    <form action="../updateProduct" method="post" enctype="multipart/form-data">

        <input type="hidden" name="id" value="<%=id%>">

        <div class="mb-3">
            <label class="form-label">Product Name</label>
            <input type="text" class="form-control" name="name" value="<%=name%>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Category</label>
            <input type="text" class="form-control" name="category" value="<%=category%>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Price (₹)</label>
            <input type="number" class="form-control" name="price" value="<%=price%>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Active</label>
            <select name="active" class="form-control">
                <option value="yes" <%= active.equals("yes") ? "selected" : "" %>>Yes</option>
                <option value="no" <%= active.equals("no") ? "selected" : "" %>>No</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Current Image</label><br>
            <img src="showimg.jsp?id=<%=id%>" width="120" height="120" style="border-radius:10px;">
        </div>

        <div class="mb-3">
            <label class="form-label">Upload New Image (Optional)</label>
            <input type="file" class="form-control" name="image">
        </div>

        <button class="btn btn-primary w-100">Update Product</button>
    </form>
</div>

</body>
</html>
