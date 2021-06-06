<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="dataBase.jsp"%>
<%@page import="java.sql.PreparedStatement"%>

<% 
String email=(String)session.getAttribute("email");
String qr="select pdf from user where email='"+email+"'";
Statement s=con.createStatement();
ResultSet rs=s.executeQuery(qr);
while(rs.next())
{
	String pdf=rs.getString("pdf");	
	session.setAttribute("pdf", pdf);
	response.sendRedirect("studymail.jsp");
}
%>