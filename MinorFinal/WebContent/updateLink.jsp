<%@include file="dataBase.jsp"%>
<%@page import="java.sql.PreparedStatement"%>

<% 

String batchId=request.getParameter("batchId");
String link=request.getParameter("link");


String qr="update user set link=? where batchId=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, link);
ps.setString(2,batchId);
int i=ps.executeUpdate();


if(i>0)
{	
	
	response.sendRedirect("manageClasses.jsp");
	
}
else
{
	out.println("record not updated");
}
con.close();
%>