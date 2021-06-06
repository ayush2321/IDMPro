<%@page import="java.sql.PreparedStatement"%>
<%@include file="dataBase.jsp"%>
<% 
String batchId=request.getParameter("batchId");
String filename=request.getParameter("filename");
%>
<%=batchId%>
<%=filename%>
<%
String qr="update user set pdf='"+filename+"' where batchId='"+batchId+"'";
PreparedStatement ps=con.prepareStatement(qr);
int i=ps.executeUpdate();

%>