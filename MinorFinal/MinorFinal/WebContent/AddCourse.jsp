<%@include file="dataBase.jsp"%>
<%@page import="java.sql.PreparedStatement"%>

<% 
String courseId=request.getParameter("courseId");
String courseName=request.getParameter("courseName");
String fees=request.getParameter("fees");

String qr="insert into courses values(?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, courseId);
ps.setString(2, courseName);
ps.setString(3, fees);

int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("CoursePanel.jsp");
	//rd.include(request,response);
	out.println("added");
}
else
{
	out.println("record not added");
}
con.close();
%>