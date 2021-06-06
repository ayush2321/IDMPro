<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>
<%@include file="dataBase.jsp" %>

<%


String newPass=request.getParameter("newpass");
String confirmPass=request.getParameter("newpass2");
if(newPass.equals(confirmPass))
{
	String email=(String)session.getAttribute("emailId");
	String qr="update user set pass=? where email='"+email+"'";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, newPass);
	
	int i=ps.executeUpdate();

if(i>0)
{ 		
	session.invalidate();
	response.sendRedirect("login.html");
		
		
		
}
else
	
{	
	response.sendRedirect("ChangePassword.jsp");
	out.println("<script>window.alert('Password does not match !');</script>");
	
	
}	
	
}
				
	con.close();

%>

