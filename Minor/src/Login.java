

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {Connection con;
	
	public Connection createConnection() throws ClassNotFoundException, SQLException
	{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/minor","root","root");
		return con;
	}
	
		
		
		
		
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			PrintWriter out=response.getWriter();
			response.setContentType("text/html");
			
			String id=request.getParameter("id");
			String pwd=request.getParameter("pwd");
			UserLogin u=new UserLogin();
			try {
				Connection c=u.createConnection();
				String qr="select * from users where id=?,pass=?";
				PreparedStatement ps=con.prepareStatement(qr);
				
				ps.setString(1, id);
				ps.setString(2, pwd);
				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{ 
					while(rs.next())
					{
					response.sendRedirect("user.html");
					}
					
				}	
					else
					{
						out.println("alert('user not found')");
					}
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				out.println(e);
			}
	}

}
