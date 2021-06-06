<%
String ot=request.getParameter("ot");
String otp=(String)session.getAttribute("otp");
if(ot.equals(otp))
{
	response.sendRedirect("ChangePassword.jsp");
}
else
{
	out.println("wrong otp");
}
%>