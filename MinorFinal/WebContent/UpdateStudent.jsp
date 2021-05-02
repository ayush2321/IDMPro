<%@include file="dataBase.jsp"%>
<%@page import="java.sql.PreparedStatement"%>

<% 
String email=request.getParameter("email");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String mob=request.getParameter("mob");
String add=request.getParameter("address");
String gen=request.getParameter("gender");
String city=request.getParameter("city");

String qr="update user set id=?,pass=?,mob=?,address=?,gender=?,city=? where name=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, email);
ps.setString(2, pass);

ps.setString(3, mob);
ps.setString(4, add);
ps.setString(5, gen);
ps.setString(6, city);
ps.setString(7, name);
int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("BatchManagePanel.jsp");
	//rd.include(request,response);
	out.println("Updated");
}
else
{
	out.println("record not updated");
}
con.close();
%>