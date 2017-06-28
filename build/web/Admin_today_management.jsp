<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="database.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>

<%!Connection conn;
    DB d ;
    String ad_name,ad_email,ad_phone, ad_pass,ad_lastlog;
    
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
    if(ad_email!=null)
    {
        PreparedStatement ps1 = conn.prepareStatement("select * from PURBALI.ADMIN_DETAILS where Ad_email=?");
        ps1.setString(1,ad_email);
        ResultSet rs1 = ps1.executeQuery();
        if(rs1!=null)
        {
            while(rs1.next())
            {                
                ad_lastlog = rs1.getString("Ad_LastLogin");
            }
        }
        rs1.close();
        ps1.close();
    }
    else
    {
        response.sendRedirect("Admin_logout.jsp");
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <title>Admin | Today's Management</title>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <script type="text/javascript" src="./scripts/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="./scripts/materialize.min.js"></script>
        <script>
            $(document).ready(function(){
                $('select').material_select();
                
                //for the Meal type and Time Slot
                var $box_breakfast = $('#id_timeslot_method_breakfast').closest('tr').hide();
                var $box_lunch = $('#id_timeslot_method_lunch').closest('tr').hide();
                var $box_dinner = $('#id_timeslot_method_dinner').closest('tr').hide();               
                
                $('#id_meal_type_method').change(function(){
                    var meal_type = $(this).val();                    
                    if(meal_type == 'meal_b'){
                        $box_breakfast.show();
                        $box_lunch.hide();
                        $box_dinner.hide();
                    } else if(meal_type == 'meal_l'){
                        $box_breakfast.hide();
                        $box_lunch.show();
                        $box_dinner.hide();
                    } else if(meal_type == 'meal_d'){
                        $box_breakfast.hide();
                        $box_lunch.hide();
                        $box_dinner.show();
                    }        
                });
            });
        </script>
        <div style=" background-color: #f5f5f5;">
            <div class="container">
                <div class="row ">
                    <div class="col offset-m7 offset-l7 z-depth-3" style="background-color: #bdbdbd">
                        <h3 style="font-weight:bold;font-family:constantia;color:#4d4d4d;font-size:30px;">Welcome Admin</h3>
                        <h4 style="font-family:constantia;color:#4d4d4d;font-size:20px;">Last Login: <%=ad_lastlog%></h4>
                    </div>
                </div>
                <div class="row" style="margin-top: 40px;"></div>
                <div class="row z-depth-1" style=" margin-top:5px; background-color: #cfd8dc;">                    
                    <div class="col s12 m2 l2 center-align">
                        <a href="Admin_today_management.jsp"><h4 style="font-family:constantia;color:#42a5f5;font-size:15px;">Today's Management</h4></a>
                    </div>
                    <div class="col s12 m2 l2 right-align">
                        <a href="Admin_user_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">User Management</h4></a>
                    </div>
                    <div class="col s12 m2 l2 right-align">
                        <a href="Admin_area_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Area Management</h4></a>
                    </div>
                    <div class="col s12 m3 l3 center-align">
                        <a href="Admin_package_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Package Management</h4></a>
                    </div>
                    <div class="col s12 m2 l2 left-align">
                        <a href="Admin_order_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Order Management</h4></a>
                    </div>
                    <div class="col s12 m1 l1 center-align">
                        <a href="#"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Logout</h4></a>
                    </div>
                </div>
            </div>
        </div>           
        <div class="container">
            <div class="row">
                <h4 style="font-family:constantia;color:#4D4D4D;font-size:25px;">Today's Deliveries</h4>
                <div class="divider"></div><br /><br />      
                <div class="col m12 l12 z-depth-1" style="background-color: #b2dfdb;">
                   <div class="col m2 l2 center-align ">
                        <h4 class="center-align"style="font-family:constantia;color:#4D4D4D;font-size:20px;">Today Order</h4>
                   </div>
                </div>   
            </div>               <!-- End of Todays order heading -->
            <div class="row">
                <form class="col m12 l12" method="POST">
                    <div class="row">
                        <div class="col m2 l2" style="margin-top: 20px;">                        
                            <h4 class="center-align"style="font-family:constantia;color:#4D4D4D;font-size:20px;">Meal Time:</h4>
                        </div>    
                        <div class="input-field col m3 l3">                            
                            <select name="meal_type_method" id="id_meal_type_method">
                                <option value="" disabled selected>Choose Meal type</option>
                                <option value="meal_b">Breakfast</option>
                                <option value="meal_l">Lunch</option>
                                <option value="meal_d">Dinner</option>
                            </select>
                        </div>  
                        <div class="col m3 l3 center-align" style="margin-top: 20px;">                        
                            <h4 class="center-align"style="font-family:constantia;color:#4D4D4D;font-size:20px;">Area:</h4>
                        </div>
                        <div class="input-field col m4 l4">                            
                            <select name="area_today_method" id="id_area_today_method">
                                <option value="" disabled selected>Choose Area</option>
                                <option value="area_delhi">Delhi</option>
                                <option value="area_har">Haryana</option>
                                <option value="area_pun">Punjab</option>
                                <option value="area_tamil">Tamil</option>
                                <option value="area_karnat">Karnataka</option>
                                <option value="area_andhra">Andhra</option>
                                <option value="area_rajas">Rajasthan</option>                                
                                <option value="area_up">U.P</option>
                                <option value="area_bihar">Bihar</option>
                            </select>
                        </div>
                    </div>      
                    <div class="row">
                        <div class="col m2 l2" style="margin-top: 40px;">                        
                            <h4 class="center-align"style="font-family:constantia;color:#4D4D4D;font-size:20px;">Time Slot:</h4>
                        </div>    
                        <div class="input-field col m3 l3">  
                            <table>
                                <tr>
                                    <td>
                                        <select name="timeslot_method_breakfast" id="id_timeslot_method_breakfast">
                                            <option value="" disabled selected>Choose Time Slot</option>
                                            <option value="break_a">06:00 - 07:00</option>
                                            <option value="break_b">07:00 - 08:00</option>
                                            <option value="break_c">08:00 - 09:00</option>
                                            <option value="break_d">09:00 - 10:00</option>                             
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="timeslot_method_lunch" id="id_timeslot_method_lunch">
                                            <option value="" disabled selected>Choose Time Slot</option>
                                            <option value="lunch_a">12:00 - 13:00</option>
                                            <option value="lunch_b">13:00 - 14:00</option>
                                            <option value="lunch_c">14:00 - 15:00</option>
                                            <option value="lunch_d">15:00 - 16:00</option>                             
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="timeslot_method_dinner" id="id_timeslot_method_dinner">
                                            <option value="" disabled selected>Choose Time Slot</option>
                                            <option value="dinner_a">19:00 - 20:00</option>
                                            <option value="dinner_b">20:00 - 21:00</option>
                                            <option value="dinner_c">21:00 - 22:00</option>
                                            <option value="dinner_d">22:00 - 23:00</option>                             
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col m6 l6 " style="margin-top: 60px;">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Search</button>
                        </div>
                    </div>
                </form>
            </div> <!--End of the Search Bar  -->
            <div class="row">
                <div class="divider"></div>
                <br />
                <table class="bordered striped">
                    <thead>
                        <tr class="z-depth-1" style="background-color: #b2dfdb;font-family:constantia;color:#4D4D4D;font-size:15px;">
                            <th data-field="id">S.No</th>
                            <th data-field="name">Name</th>
                            <th data-field="mobile">Mobile</th>
                            <th data-field="item_replace_stat">Replace Item</th>
                            <th data-field="area">Area</th>
                            <th data-field="meal_time">Meal Time</th>
                            <th data-field="overall_stat">Status</th>
                        </tr>
                    </thead>                    
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Mukesh Sheoran</td>
                            <td>9975058336</td>
                            <td>none</td>
                            <td>Nanganallur</td>
                            <td>Dinner 20:00 - 21:00</td>
                            <td>Preparing</td>
                        </tr>
                    </tbody>
                </table>                
            </div>
            <br /><br />
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

