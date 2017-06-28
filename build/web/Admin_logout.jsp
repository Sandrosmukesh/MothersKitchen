<%@page language="java"%>
<%@page import="database.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.io.*,java.util.*"%>
<%@page import="javax.servlet.*,java.text.*"%>


<%!Connection conn;
    DB d ;
    String ad_name,ad_email,ad_phone, ad_pass;
%>
<%
    try
    {
        d = new DB();
        conn = d.connectToDB();
    }
    catch(NullPointerException e)
    {
        out.println("Error Creating object for the database");
    }
%>

<%
    ad_email = (String)session.getAttribute("refId");
    Date dNow = new Date();
    SimpleDateFormat currDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    if(ad_email!=null)
    {
        PreparedStatement ps1 = conn.prepareStatement("UPDATE PURBALI.ADMIN_DETAILS SET AD_LASTLOGIN=? WHERE AD_EMAIL=?");
        ps1.setString(1,currDate.format(dNow));
        ps1.setString(2,ad_email);
        ps1.executeUpdate();        
        ps1.close();
        conn.close();
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <title>Admin | Logout</title>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <script type="text/javascript" src="./scripts/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="./scripts/materialize.min.js"></script>
        <div style=" background-color: #f5f5f5;">
            <div class="container">
                <div class="row ">
                    <div class="col offset-m7 offset-l7 z-depth-3" style="background-color: #bdbdbd">
                        <h3 style="font-weight:bold;font-family:constantia;color:#4d4d4d;font-size:30px;">Welcome Admin</h3>
                        <h4 style="font-family:constantia;color:#4d4d4d;font-size:20px;">Last Login: </h4>
                    </div>
                </div>
                <div class="row" style="margin-top: 40px;"></div>
                <div class="row z-depth-1" style=" margin-top:5px; background-color: #cfd8dc;">
                    <div class="col s12 m1 l1 center-align">
                        <a href="AdminHome.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Home</h4></a>
                    </div>
                    <div class="col s12 m2 l2 right-align">
                        <a href="Admin_today_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Today's Management</h4></a>
                    </div>
                    <div class="col s12 m2 l2 center-align">
                        <a href="Admin_user_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">User Management</h4></a>
                    </div>
                    <div class="col s12 m2 l2 center-align">
                        <a href="Admin_area_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Area Management</h4></a>
                    </div>
                    <div class="col s12 m2 l2 center-align">
                        <a href="Admin_package_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Package Management</h4></a>
                    </div>
                    <div class="col s12 m2 l2 right-align">
                        <a href="Admin_order_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Order Management</h4></a>
                    </div>
                    <div class="col s12 m1 l1 center-align">
                        <a href="Admin_logout.jsp"><h4 style="font-family:constantia;color:#42a5f5;font-size:15px;">Logout</h4></a>
                    </div>
                </div>
            </div>
        </div>           
        <div class="container"><br /><br /><br /><br /><br />
            <div class="row">
                  <h3>You are Logged out</h3>
                  <br><br>
                  <h3>Redirecting to the Login Page........ </h3>
                  <%session.invalidate();%>
                  <% response.setHeader("Refresh","0;url=Admin_index.jsp"); %>  
                  <br><br><br>
            </div>
            <div class="divider"></div>             
        </div>          
        <br /><br /><br />
        <!-- Start of Footer -->
        <footer class="page-footer" style="background-color: #212121">
            <div class="container">
                <div class="row"></div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                     <div class="row">
                        <div class="col m2 l2 left-align"><a class="grey-text text-lighten-4 right" href="#">Best Rate Guarntee</a></div>
                        <div class="col m1 l1"><h5> | </h5></div>
                        <div class="col m1 l1"><a class="grey-text text-lighten-4 right" href="#">Google Map</a>|</div>
                        <div class="col m1 l1"><h5> | </h5></div>
                        <div class="col m1 l1"><a class="grey-text text-lighten-4 right" href="#">Website Terms of Use</a>|</div>
                        <div class="col m1 l1"><h5> | </h5></div>
                        <div class="col m1 l1"><a class="grey-text text-lighten-4 right" href="#">Privacy Statement</a>|</div>
                        <div class="col m1 l1"><h5> | </h5></div>
                        <div class="col m1 l1"><a class="grey-text text-lighten-4 right" href="#">Affiliates</a>|</div>
                        <div class="col m1 l1"><h5> | </h5></div>
                        <div class="col m1 l1"><a class="grey-text text-lighten-4 right" href="#">About us!</a></div>                        
                    </div>                     
                </div>
            </div>
        </footer>
        <!-- End of Footer -->
    </body>
</html>

