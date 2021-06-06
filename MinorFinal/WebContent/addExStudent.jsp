<%@include file="dataBase.jsp"%>
<%@page import="java.sql.PreparedStatement"%>

<% 
String stdId=request.getParameter("stdId");

String email=request.getParameter("email");
String name=request.getParameter("name");
String batchId=request.getParameter("batchId");
String cId=request.getParameter("cId");



String qr="insert into exusers values(?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(2, stdId);
ps.setString(1, email);
ps.setString(3, name);
ps.setString(4, batchId);
ps.setString(5, cId);


int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("manageExUsers.jsp");
	
}
else
{
	out.println("record not added");
}
con.close();
%>