<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="dataBase.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="css/admin.css" />
<title>Insert title here</title>
</head>
<body>

<h1>Enroll For the Course</h1>
<br><br>


 <form action="EnrollStudent.jsp">


<tr>
<th scope="row"></th>
<td>
<select id="selectedCourse" name="courseName">
<%
String qr="select courseName from courses";

Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);
if(rs.next())
{
	do
	{
		
		String courseName=rs.getString("courseName");
		
		
				%>
		
		


      <option value="<%=courseName%>"><%=courseName %></option>
            


                            
                            
                                <%
	}while(rs.next());

	
}


else
{
	out.println("No Records are there");
}



%>
        </select>
</td>
<td><input type=text name=name placeholder="Enter name" /></td> 
<td><input type=text name=email placeholder="Enter Email"/></td>
<td><input type=text name=mob  placeholder="Enter contact"/></td> 
<td><input type=text name=address placeholder="Enter address"/></td> 
	<td><input type=text name=gender placeholder="Enter gender"/></td> 
<td><input type=text name=city placeholder="Enter city"/></td>
<td><input type=text name=pass placeholder="Enter default password"/></td>    
  
<td><button>Enroll</button></td>
</form>
</td>
</tr>
</form>

<% 


con.close();
%>

</body>
</html>