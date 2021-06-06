<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="dataBase.jsp" %>

<% 
String email=(String)session.getAttribute("email");
String qr="select link from user where email='"+email+"'";
Statement s=con.createStatement();
ResultSet rs=s.executeQuery(qr);
while(rs.next()){
String link=rs.getString("link");
session.setAttribute("link", link);
response.sendRedirect("linkmail.jsp");
}
%>