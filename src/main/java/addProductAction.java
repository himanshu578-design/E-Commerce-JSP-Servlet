
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import Project1.DBconnection;


@WebServlet("/addProductAction")
@MultipartConfig(maxFileSize=16177215)
public class addProductAction extends HttpServlet {
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
		 String id=request.getParameter("id");
		 String pname=request.getParameter("pname");
		 String category=request.getParameter("category");
		 String price=request.getParameter("price");
		 String active=request.getParameter("active");

		 InputStream inputStream=null;
		 Part filePart=request.getPart("image");
		 if(filePart!=null)
		 {
			 inputStream=filePart.getInputStream();
		 }
		 
		 response.setContentType("text/html");
	     PrintWriter out=response.getWriter();
	     
	     try
	     {
	    	 Connection con=DBconnection.getConnection();
	    	 PreparedStatement ps=con.prepareStatement("insert into product(id,name,category,price,active,product_image) values(?,?,?,?,?,?)");
	    	 ps.setString(1, id);
	    	 ps.setString(2, pname);
	    	 ps.setString(3, category);
	    	 ps.setString(4, price);
	    	 ps.setString(5, active);
	    	 ps.setBlob(6,inputStream);
	    	 
	    		    // Your DB insert code
	    		    int raw = ps.executeUpdate();
	    		    
	    		    if(raw > 0) 
	    		    {
	    		        response.sendRedirect("Admin/addProduct.jsp?msg=Product Added Successfullyyy");
	    		    }
	    		} catch(Exception e) {
	    		    e.printStackTrace();
	    		    request.getSession().setAttribute("msg", "Error: " + e.getMessage());
	    		    request.getSession().setAttribute("type", "error");
	    		    response.sendRedirect("addProduct.jsp");
	    		}

}

}
