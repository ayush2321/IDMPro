<%@include file="dataBase.jsp"%>
<%@page import="java.sql.PreparedStatement"%>

<% 

String stdId=request.getParameter("stdId");


String qr="delete from user where stdId=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, stdId);

int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("BatchManagePanel.jsp");
	
}
else
{
	out.println("record not deleted");
}
con.close();
%>