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
                                <p class="fs-5">Centres</p>  
                            </div>
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
                        <table class="table bg-white rounded shadow-sm  table-hover " >
                            <thead>
                                <tr>
                                    <th scope="col" >#</th>
                                    <th scope="col">Student name</th>
                                    <th scope="col">Student email</th>
                                    <th scope="col">Contact</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">City</th>
                                    <th scope="col">Pass</th>
                                </tr>
                            </thead>
                            
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="dataBase.jsp"%>
<%
int c=1;
int tempPass=10001;
String qr="select * from user";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);
if(rs.next())
{
	do
	{
		String id=rs.getString("id");
		String pass=rs.getString("pass");
		String name=rs.getString("name");
		String mob=rs.getString("mob");
		String add=rs.getString("address");
		String gender=rs.getString("gender");
		String city=rs.getString("city");
		
				%>
		
		

                            
                            <tbody >
                            
                               
									<tr>
									<th scope="row"><%=c++%></th>
									<form action="UpdateStudent.jsp">
									<td><input type=text name=name value="<%=name%>" readonly/></td> 
    								<td><input type=text name=email value="<%=id %>" /></td>
									<td><input type=text name=mob  value="<%=mob %>" /></td> 
									<td><input type=text name=address value="<%=add%>" /></td> 
									<td><input type=text name=gender value="<%=gender %>" /></td> 
    								<td><input type=text name=city value="<%=city %>" /></td>
    								<td><input type=text name=pass value="<%=pass %>" /></td> 
									
									</tr>
									<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><input type=submit value="Update" /></td>									
									</form>
									<form action=RemoveStudent.jsp>
									<input type=hidden name=id value="<%=id %>" />
									<td><button>Delete</button></td>
									</form>
                                	</tr> 
                                 
                                <%
	}while(rs.next());

}


else
{
	out.println("No Records are there");
}

%>

<tr>
    <th scope="row"></th>
     <form action="AddStudent.jsp">
    <td><input type=text name=name placeholder="Enter name" /></td> 
    <td><input type=text name=email placeholder="Enter Email"/></td>
	<td><input type=text name=mob  placeholder="Enter contact"/></td> 
	<td><input type=text name=address placeholder="Enter address"/></td> 
		<td><input type=text name=gender placeholder="Enter gender"/></td> 
    <td><input type=text name=city placeholder="Enter city"/></td>
    <td><input type=text name=pass placeholder="Enter default password"/></td>    
    <td><button>add</button></td>
    </form>
</td>
</tr>
<%






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