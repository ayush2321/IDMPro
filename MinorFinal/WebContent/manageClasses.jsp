<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="css/admin.css" />
    <title>Welcome Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        	
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Dashboard</h2>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                
                                <%
                              //---------Session Verification---------//
                                session=request.getSession();
                                String checkId=(String)session.getAttribute("id");  
                                  
                                 if(checkId==null){
                                	response.sendRedirect("index.html");
                                 }

                                //---------Session Verification Ends---------//
                                
                                
                                %>
                                <i class="fas fa-user me-2"></i><%= checkId%>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="Admin.jsp">Profile</a></li>
                                <li><a class="dropdown-item" href="#">Settings</a></li>
                                <li><a class="dropdown-item" href="Logout.jsp">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="container-fluid px-4">
                <div class="row g-3 my-2">
                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                             <h3 class="fs-2">8000+</h3>
                                <p class="fs-5">Students</p>
                           </div>
                            <i class="fas fa-gift fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                   <h3 class="fs-2">40+</h3>
                                <p class="fs-5">Teachers</p>   
                            </div>
                            <i
                                class="fas fa-hand-holding-usd fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                                <h3 class="fs-2">20+</h3>
                                <p class="fs-5">Centres</p>                             </div>
                            <a><i class="fa fa-twitter "></i></a>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                            <div>
                               <h3 class="fs-2">5000+</h3>
                                <p class="fs-5">Placements</p>
                               
                            </div>
                            <i class="fas fa-chart-line fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                        </div>
                    </div>
                </div>

                <div class="row my-5">
                    <h3 class="fs-4 mb-3">Student</h3>
                    <div class="col">
                        <table class="table bg-white rounded shadow-sm  table-hover">
                            <thead>
                                <tr>
                                    <th scope="col" >#</th>
                                    <th scope="col">Batch Id</th>
                                    <th scope="col">Course Name</th>
                                    <th scope="col">link</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="dataBase.jsp"%>
<%


int c=1;
String qr="select distinct batchId,courseName,link from user ";
PreparedStatement ps =con.prepareStatement(qr);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
do
{
	String batchId=rs.getString("batchId");
	String cName=rs.getString("courseName");
	String link=rs.getString("link");
%>

<tbody>                        
									<tr>
									<th scope="row"><%=c++%></th>
									<form action="updateLink.jsp">
									<td><input type=text name=batchId value=<%= batchId%> readonly/></td>
									<td><input type=text name=courseName value=<%=cName%> readonly /></td>
									<td><input type=text name=link value=<%=link%> /></td> 
									<td><input type=submit value="Update" /></td>									
									</form>
									</tr>    
</td>
</tr>
<%
}
while(rs.next());
}
 
con.close();
%>

                                
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };
    </script>
</body>
</html> 