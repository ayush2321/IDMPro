<html>

    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/loginCss.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
</head>
<body>
   <section class="form my-4 mx-5">
      <div class="container">
          <div class="row no-gutters">
              <div class="col-lg-5">
                  <img src="images/loginimg2.jpg" class="img-fluid"alt="">
              </div>
              <div class="col-lg-7 px-5 pt-5">
                  <h1 class="font-weight-bold py-3">Enter your password</h1>
                  <div ></div>

                  


                  
<form action="UpdatePass.jsp">

                      <div class="form-row">
                          <div class="col-lg-7">
                            <input type="password"   id="p1" placeholder="Enter New Password"class="form-control my-3 p-4" name="newpass"/>
                          </div>
                      </div>
                      <div class="form-row">
                        <div class="col-lg-7">
                          <input type="password"  id="p2" placeholder="Confirm Password"class="form-control" name="newpass2">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-lg-7">
                      <input  type="submit" name="ulogin" class="btn1 mt-3 mb-0" value="Change Password"  > 
                        </div>
                    </div>
                  
                      </form>                   
              </div>
          </div>
      </div>
   </section>
</body>

    </html>


