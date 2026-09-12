<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection" %>
<%
    String productIdStr = request.getParameter("product_id");
    String quantityStr = request.getParameter("quantity");
    String email = (String)session.getAttribute("email");

    try {
        if(email != null && productIdStr != null && !productIdStr.isEmpty()
           && quantityStr != null && !quantityStr.isEmpty()){

            int productId = Integer.parseInt(productIdStr);
            int quantity = Integer.parseInt(quantityStr);

            Connection con = DBconnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE cart c INNER JOIN product p ON c.product_id = p.id " +
                "SET c.quantity=?, c.total = p.price * ? " +
                "WHERE c.product_id=? AND c.email=? AND c.address IS NULL"
            );

            ps.setInt(1, quantity);
            ps.setInt(2, quantity);
            ps.setInt(3, productId);
            ps.setString(4, email);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();
           if(rows>0)
           {
            response.sendRedirect("myCart.jsp?msg=updated");
           }
        } else {
            // Redirect if any parameter is missing
            response.sendRedirect("myCart.jsp");
        }
    } catch(NumberFormatException nfe){
        // Redirect if parsing fails
        response.sendRedirect("myCart.jsp");
    } catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("myCart.jsp");
    }
%>
