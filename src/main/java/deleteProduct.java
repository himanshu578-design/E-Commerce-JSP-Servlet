import java.io.IOException;
import java.sql.*;

import Project1.DBconnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteProduct")
public class deleteProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBconnection.getConnection();
            ps = con.prepareStatement("DELETE FROM product WHERE id=?");
            ps.setInt(1, id);

            int i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("Admin/allProducts.jsp?msg=deleted");
            } else {
                response.sendRedirect("Admin/allProducts.jsp?msg=error");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
