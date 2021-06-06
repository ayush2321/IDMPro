<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="dataBase.jsp"%>
<%

String stdId=request.getParameter("stdId");
String emailId=request.getParameter("emailId");

String qr="select * from exUsers where stdId=? and email=?";
PreparedStatement ps=con.prepareStatement(qr);

ps.setString(1, stdId);
ps.setString(2, emailId);
ResultSet rs=ps.executeQuery();

if(rs.next())
{ 		
	//session=request.getSession();
	//session.setAttribute("id", id);
	response.sendRedirect("UserPanel.jsp");
		
		
		
}
else
	
{	
	RequestDispatcher rd=request.getRequestDispatcher("register.html");
	out.println("<script>window.alert('invalid Student Id and email');</script>");
	
	
}	
	

				
	con.close();

%>