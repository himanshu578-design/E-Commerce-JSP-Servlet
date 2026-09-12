<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.* , Project1.DBconnection ,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
response.setContentType("image/jpeg");
ResultSet rs=null;
PreparedStatement ps=null;
Connection con=null;
int id=Integer.parseInt(request.getParameter("id"));
try
{
	con=DBconnection.getConnection();
	 ps=con.prepareStatement("select product_image from product where id=?");
    ps.setInt(1, id);
     rs= ps.executeQuery();
    
    if(rs.next())
    {
    	byte[] imgData=rs.getBytes("product_image");
    	
    	if(imgData!=null && imgData.length>0)
    	{
    		OutputStream os=response.getOutputStream();
    		os.write(imgData);
    		os.flush();
    		os.close();
    		}
    	else
    	{
    		out.println("<h3 style='color:red'>No Image Found</h3>");
    	}
   	
    }else
	{
		out.println("<h3 style='color:red'>product not Found</h3>");

	}
   
}catch(Exception e)
{
e.printStackTrace();	
}finally
{
try{if(rs!=null) rs.close();}catch(Exception e){}	
try{if(rs!=null) ps.close();}catch(Exception e){}	
try{if(rs!=null) con.close();}catch(Exception e){}	

}
%>
</body>
</html>