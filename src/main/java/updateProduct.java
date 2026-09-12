import Project1.DBconnection;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/updateProduct")
public class updateProduct extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String active = request.getParameter("active");

            // IMAGE PART
            Part filePart = request.getPart("image");
            InputStream inputStream = null;

            boolean hasNewImage = false;
            if (filePart != null && filePart.getSize() > 0) {
                inputStream = filePart.getInputStream();
                hasNewImage = true;
            }

            Connection con = DBconnection.getConnection();

            PreparedStatement ps;

            int i = 0;

         // 1️⃣ UPDATE product
         if (hasNewImage) {
             ps = con.prepareStatement(
                 "UPDATE product SET name=?, category=?, price=?, active=?, product_image=? WHERE id=?");
             ps.setString(1, name);
             ps.setString(2, category);
             ps.setString(3, price);
             ps.setString(4, active);
             ps.setBlob(5, inputStream);
             ps.setInt(6, id);
         } else {
             ps = con.prepareStatement(
                 "UPDATE product SET name=?, category=?, price=?, active=? WHERE id=?");
             ps.setString(1, name);
             ps.setString(2, category);
             ps.setString(3, price);
             ps.setString(4, active);
             ps.setInt(5, id);
         }

         i = ps.executeUpdate();   // UPDATE executed

         // 2️ If product inactive → delete from cart
         if ("no".equals(active)) {
             PreparedStatement ps2 = con.prepareStatement(
                 "DELETE FROM cart WHERE product_id=? AND address IS NULL");
             ps2.setInt(1, id);
             ps2.executeUpdate();
         }

         // 3️ Single redirect only
         if (i > 0) {
             response.sendRedirect(request.getContextPath() + "/Admin/allProducts.jsp?msg1=updated");
         } else {
             response.sendRedirect(request.getContextPath() + "/Admin/allProducts.jsp?msg1=failed");
         }


        } catch (Exception e) {
            e.printStackTrace();
            out.print(e);
        }

    }
}
