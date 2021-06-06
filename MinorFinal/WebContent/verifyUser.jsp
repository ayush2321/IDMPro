<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>
<%@include file="dataBase.jsp" %>
<%


String email=request.getParameter("id");
String stdId=request.getParameter("stdId");
String qr="select * from user where stdId=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, stdId);

ResultSet rs=ps.executeQuery(); 

if(rs.next())
{ 		
		session=request.getSession();
		session.setAttribute("emailId", email);
		response.sendRedirect("mailJSP.jsp");
		
		
		
		
}
else
	
{	
	RequestDispatcher rd=request.getRequestDispatcher("forgotPass.html");
	out.println("<script>window.alert('user does not exist');</script>");
	
	
}	
	

				
	con.close();

%>

