<%@include file="dataBase.jsp"%>
<%@page import="java.sql.PreparedStatement"%>

<% 

String id=request.getParameter("id");


String qr="delete from user where id=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, id);

int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("BatchManagePanel.jsp");
	//rd.include(request,response);
	out.println("added");
}
else
{
	out.println("record not deleted");
}
con.close();
%>