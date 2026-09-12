package Project1;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBconnection 
{
	private static final String url="jdbc:mysql://localhost:3306/ospjsp";
	private static final String username="root";
	private static final String password="himansh1144A";
	private static Connection con;
	
	
  public static Connection getConnection()
  {
	  try
	  {	  
		  if(con==null || con.isClosed())
		  {
	 Class.forName("com.mysql.cj.jdbc.Driver");  
	 con=DriverManager.getConnection(url,username,password);  
		  }
		  }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  
	  return con;
	  }
  
}
