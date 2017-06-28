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
    }
    else
    {
        response.sendRedirect("Admin_logout.jsp");
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin | Package Management</title>
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
                        <a href="Admin_today_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Today's Management</h4></a>
                    </div>
                    <div class="col s12 m2 l2 right-align">
                        <a href="Admin_user_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">User Management</h4></a>
                    </div>
                    <div class="col s12 m2 l2 right-align">
                        <a href="Admin_area_management.jsp"><h4 style="font-family:constantia;color:#4D4D4D;font-size:15px;">Area Management</h4></a>
                    </div>
                    <div class="col s12 m3 l3 center-align">
                        <a href="Admin_package_management.jsp"><h4 style="font-family:constantia;color:#42a5f5;font-size:15px;">Package Management</h4></a>
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
                <h4 style="font-family:constantia;color:#4D4D4D;font-size:25px;">Manage Packages</h4>
                <div class="divider"></div><br /><br />      
                <div class="col m12 l12 z-depth-1" style="background-color: #b2dfdb;">
                   <div class="col m3 l3 center-align ">
                        <h4 class="center-align"style="font-family:constantia;color:#4D4D4D;font-size:20px;">Create New Package</h4>
                   </div>
                </div>   
            </div>               <!-- End of Todays order heading -->
            <div class="row">
                <form class="col m12 l12" method="POST">
                    <div class="row">
                        <div class="col m2 l2">                        
                            <h4 class="center-align" style="font-family:constantia;color:#4D4D4D;font-size:20px;">Category: </h4>
                        </div> 
                        <div class="col m3 l3" style="margin-top: 18px;">
                            <input type="checkbox" id="cb_breakfast" />
                            <label for="cb_breakfast" style="font-family:constantia;color:#4D4D4D;font-size:17px;">Breakfast</label>
                        </div>
                        <div class="col m3 l3" style="margin-top: 18px;">
                            <input type="checkbox" id="cb_lunch" />
                            <label for="cb_lunch" style="font-family:constantia;color:#4D4D4D;font-size:17px;">Lunch</label>
                        </div>
                        <div class="col m3 l3" style="margin-top: 18px;">
                            <input type="checkbox" id="cb_dinner" />
                            <label for="cb_dinner" style="font-family:constantia;color:#4D4D4D;font-size:17px;">Dinner</label>
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col m2 l2" style=" margin-top:15px;">
                            <h4 class="center-align" style="font-family:constantia;color:#4D4D4D;font-size:20px;">Price for Day: </h4>
                        </div>
                        <div class="input-field col m3 l3">
                            <input id="input_text" type="text" length="10">
                            <label for="input_text">Enter the price for Today's Meal    </label>
                        </div>                        
                        <div class="col m7 l7 center-align">
                            <div class="input-filed file-field" style="margin-top: 15px">
                                <div class="btn" >
                                    <span>Select Image</span>
                                    <input type="file"/>
                                </div>									
                                <div class="file-path-wrapper">
                                    <input id="file2" type="text" class="file-path validate" />
                                </div>										
                            </div>	                                
                        </div>
                    </div>
                    <div class="row">
                        <div class="col m2 l2">                        
                            <h4 class="center-align" style="font-family:constantia;color:#4D4D4D;font-size:20px;">Description: </h4>
                        </div>
                        <div class="col m7 l7">
                            <div class="row">
                                <div class="input-field col m6 l6">
                                    <textarea id="textarea1" class="materialize-textarea" length="200"></textarea>
                                    <label for="textarea1">Click here to add a Description</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 m12 center-align">
                             <button class="btn waves-effect waves-light btn-large" type="submit" name="action">Submit</button>
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
                            <th data-field="name">Package</th>
                            <th data-field="name">Price Per Day</th>
                            <th data-field="name">Description</th>
                            <th data-field="name">Image</th>
                            <th class="right-align"data-field="mobile">Edit</th>
                            <th class="center-align"data-field="item_replace_stat">Delete</th>
                        </tr>
                    </thead>                    
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Breakfast Lunch</td>
                            <td>100.00</td>
                            <td>Sandwich-Chole-Rice</td>
                            <td><img src="images/packages/rice-chawal.jpg" alt="" class="square responsive-img hoverable" style="width: 100px; height: 70px;"/></td>
                            <td class="right-align"><img src="images/button_edit.png" alt="" class="square responsive-img hoverable" style="width: 38px; height: 38px;"/></td>
                            <td class="center-align"><img src="images/button_delete.png"alt="" class="square responsive-img hoverable" style="width: 38px; height: 38px;"/></td>
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

