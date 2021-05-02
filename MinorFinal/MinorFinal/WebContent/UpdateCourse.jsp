<%@include file="dataBase.jsp"%>
<%@page import="java.sql.PreparedStatement"%>

<% 
String courseId=request.getParameter("courseId");
String courseName=request.getParameter("courseName");
String fees=request.getParameter("fees");

String qr="update courses set courseName=?,fees=? where courseId=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, courseName);
ps.setString(2, fees);
ps.setString(3, courseId);

int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("CoursePanel.jsp");
	//rd.include(request,response);
	out.println("Updated");
}
else
{
	out.println("record not updated");
}
con.close();
%>