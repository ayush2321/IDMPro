<%
	session=request.getSession();
	session.invalidate();
	response.sendRedirect("index.html");
%>