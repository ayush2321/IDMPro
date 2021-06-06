<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>
<%@include file="dataBase.jsp" %>
<%


String email=request.getParameter("id");
String pwd=request.getParameter("pwd");

String qr="select * from user where email=? and pass=?";
PreparedStatement ps=con.prepareStatement(qr);

ps.setString(1, email);
ps.setString(2, pwd);
ResultSet rs=ps.executeQuery();

if(rs.next())
{ 		
	session=request.getSession();
	session.setAttribute("email", email);
	response.sendRedirect("UserPanel.jsp");
		
		
		
}
else
	
{	
	RequestDispatcher rd=request.getRequestDispatcher("login.html");
	out.println("<script>window.alert('invalid id pass');</script>");
	
	
}	
	

				
	con.close();

%>

