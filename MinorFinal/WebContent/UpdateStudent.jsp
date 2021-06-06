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
String courseName=request.getParameter("courseName"); 
String stdId=request.getParameter("stdId");
String batchId=request.getParameter("batchId");
String link=request.getParameter("link");
String t=request.getParameter("topic");
String pdf=request.getParameter("pdf");
 String topic =t.replaceAll("\\s", "_");
String qr="update user set email=?,pass=?,name=?,mob=?,address=?,gender=?,city=? ,courseName=?,batchId=?,link=?,topic=?,pdf=? where stdId=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, email);
ps.setString(2, pass);

ps.setString(3, name);
ps.setString(4, mob);
ps.setString(5, add);
ps.setString(6, gen);
ps.setString(7, city);
ps.setString(8, courseName);
ps.setString(9, batchId);
ps.setString(10,link);
ps.setString(11,topic);
ps.setString(13, stdId);
ps.setString(12, pdf);
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