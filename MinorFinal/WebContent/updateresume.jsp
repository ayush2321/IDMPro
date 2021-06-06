<%@include file="dataBase.jsp"%>
<%@page import="java.sql.PreparedStatement"%>

<% 

String email=request.getParameter("email");

String name=request.getParameter("name");


String stdId=request.getParameter("stdId");

String t=request.getParameter("topic");
 String topic =t.replaceAll("\\s", "_");
String qr="update user set email=?,name=?,topic=?where stdId=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, email);


ps.setString(2, name);
ps.setString(3, topic);
ps.setString(4, stdId);
int i=ps.executeUpdate();
if(i>0)
{	String d="done";
	session.setAttribute("done", d);
	
	response.sendRedirect("getLink.jsp");
	//rd.include(request,response);
	
}
else
{
	out.println("record not updated");
}
con.close();
%>