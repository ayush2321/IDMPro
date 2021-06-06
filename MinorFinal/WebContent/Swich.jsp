<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="dataBase.jsp"%>
<%
String email=(String)session.getAttribute("email");
String oldCourseName=request.getParameter("oldCourseName");
String newCourseName=request.getParameter("newCourseName");

String qr="update user set courseName=? where email=? ";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, newCourseName );
ps.setString(2, email);
int i=ps.executeUpdate();
if(i>0)
{
	
 	response.sendRedirect("SwitchCourse.jsp");

}
else
{
	out.println("<script>window.alert('Course  not Updated ');</script>");	
}


con.close();

							
                                 
                          
%>