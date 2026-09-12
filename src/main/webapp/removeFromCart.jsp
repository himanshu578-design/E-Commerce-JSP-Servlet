<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Project1.DBconnection" %>
<%
    String productIdStr = request.getParameter("id");
    String email = (String)session.getAttribute("email");

    try {
        if(email != null && productIdStr != null && !productIdStr.isEmpty()){
            int productId = Integer.parseInt(productIdStr.trim());

            Connection con = DBconnection.getConnection();

            // Delete the item from cart
            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM cart WHERE product_id=? AND email=? AND address IS NULL"
            );
            ps.setInt(1, productId);
            ps.setString(2, email);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            if(rows > 0){
                response.sendRedirect("myCart.jsp?msg=removed");
            } else {
                response.sendRedirect("myCart.jsp");
            }
        } else {
            response.sendRedirect("myCart.jsp");
        }
    } catch(NumberFormatException nfe){
        response.sendRedirect("myCart.jsp");
    } catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("myCart.jsp");
    }
%>
