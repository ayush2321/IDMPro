

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Uregs
 */
@WebServlet("/RegUser")
public class RegUser extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		String mob=request.getParameter("mob");
		String add=request.getParameter("address");
		String gen=request.getParameter("gender");
		String city=request.getParameter("city");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/minor","root","root");
			String qr="insert into user values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(qr);
			ps.setString(1, "101");
			ps.setString(2, email);
			ps.setString(3, pass);
			ps.setString(4, name);
			ps.setString(5, mob);
			ps.setString(6, add);
			ps.setString(7, gen);
			ps.setString(8, city);
			ps.setString(9, "java");
			ps.setString(10, "Tobedecide");
			ps.setString(11, "Tobedecide");
			ps.setString(12, "Tobedecide");
			ps.setString(13, "Tobedecide");
			//ps.setString(10, "Tobedecide");
			int i=ps.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("login.html");
				rd.include(request, response);
				out.println("<script>window.alert('sucessfully registered');</script>");
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("SignUp.html");
				rd.include(request, response);
				out.println("<script>window.alert('registration failed');</script>");
			}
			con.close();
		} catch (Exception e) {
			out.println(e);
		}
	}

}
