<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <title>Admin Login | Mother's Kitchen</title>	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/styles.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/settings.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/responsive.css" media="all">
        <link rel="stylesheet" type="text/css" href="css/color1.css" title="color1">
	<link rel="alternate stylesheet" type="text/css" href="css/color2.css" title="color2">
	<link rel="alternate stylesheet" type="text/css" href="css/color3.css" title="color3">
	<link rel="alternate stylesheet" type="text/css" href="css/color4.css" title="color4">
		
	<!-- javascripts -->	        	
	<script type="text/javascript" src="scripts/jquery.js"></script> <!-- for mobile window -->  
	<script type="text/javascript" src="scripts/counter.js"></script> <!-- for mobile window -->  
	<script src="scripts/script.js"></script>  <!-- for mobile window -->      
	<script src="scripts/styleswitcher.js"></script> <!-- for style switching  --> 
        <script src ="scripts/check.js" ></script>	
	
</head>
<body>
<!--    
<!% String email = (String)session.getAttribute("refId"); 
   if(email!=null)
   { %>
    <script type="text/javascript"> alert("You are already LogedIn");</script>
    <!% response.setHeader("Refresh","0;url=userHome.jsp");   
   }
%>
     -->
 
 <!--Start of Content -->
 <div style="background: url('images/back-1.jpg') ; background-repeat: no-repeat; background-size: 1358px 700px; ">
 <div class="login_panel" >
     <div class="login_matter">
         <h3> Admin Login</h3>
         <form name="loginForm" method="POST" action="AdminLoginVerify.do" id="formLogin" onSubmit="return checkLogin()" >				
             <div class="heading">Email-ID</div>
             <input name="lemail" class="textbox" type="text">
             <div class="heading">Password</div>
             <input name="lpass" autocomplete="off" class="textbox" type="password">
             <div><input name="butt" value="Login" style="margin:20px 0 0 0; height:35px;width:100px" type="submit"></div>
         </form>
         <div class="heading" style="margin-top:10px;">
             <a href="#">What's my password</a>  &nbsp;
         </div>
     </div>           
 </div>
 </div>
 
 <!--End of Content -->
 <!-- START footer -->
 <footer>
     <!-- START #ft-footer -->
     <div id="ft-footer">
         <div class="footer-overlay">
             <div class="container">
                 <div class="row"></div>
             </div>
         </div>
     </div>
     <!-- END #ft-footer -->
     <!-- START #ex-footer -->
     <div id="ex-footer">
         <div class="container">
             <div class="row">
                 <nav class="col-md-12">
                     <ul class="footer-menu">
                         <li><a href="#">Best Rate Guarntee</a></li>
                         <li><a href="#">Google Map</a></li>
                         <li><a href="#">Website Terms of Use</a></li>
                         <li><a href="#">Privacy Statement</a></li>
                         <li><a href="#">Affiliates</a></li>
                         <li class="last-item"><a href="#">About us!</a></li>
                     </ul>
                 </nav>						
             </div>
         </div>
     </div>
     <!-- END #ex-footer -->
 </footer>
 <!-- END footer -->		  
 <!-- end Wrapper -->   
</body>
</html>
			