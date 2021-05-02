<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>
<%@include file="dataBase.jsp" %>
<%


String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

String qr="select * from user where id=? and pass=?";
PreparedStatement ps=con.prepareStatement(qr);

ps.setString(1, id);
ps.setString(2, pwd);
ResultSet rs=ps.executeQuery();

if(rs.next())
{ 		
		
		response.sendRedirect("UserPanel.jsp");
		
		
		
}
else
	
{	
	RequestDispatcher rd=request.getRequestDispatcher("login.html");
	out.println("<script>window.alert('invalid id pass');</script>");
	
	
}	
	

				
	con.close();

%>

