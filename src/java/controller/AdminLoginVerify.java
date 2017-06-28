
package controller;

import database.DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginVerify extends HttpServlet {
    
    private Connection con;
    @Override
    public void init()
    {
        DB d = new DB();
        con = d.connectToDB();
    }    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
           
          String id,password;  
          String email = request.getParameter("lemail");
          String pass = request.getParameter("lpass");          
          try
          {
              int flag=0;  
              
              PreparedStatement ps = con.prepareStatement("select * from PURBALI.ADMIN_DETAILS");
              ResultSet rs = ps.executeQuery();
              if(rs!=null)
              {
                  while(rs.next())
                  {                      
                      id = rs.getString("AD_EMAIL");
                      password = rs.getString("AD_PASS");   
                      
                      if((email.equals(id))&&(pass.equals(password)))
                      {                          
                          flag = 1;                             
                          break;
                      }
                  }
                  rs.close();
              }
              ps.close();
              if(flag==1)
              {                  
                  HttpSession hs = request.getSession();
                  hs.setAttribute("refId",email);
                  RequestDispatcher rd = request.getRequestDispatcher("Admin_today_management.jsp");
                  rd.forward(request,response);                    
              }
              else
              {
                  out.println("<html><head><title>Invalid User</title></head><body><h3><br><br>Incorrect Email-Id or Password");
                  out.println("<br><br><a href='Admin_index.jsp'>Click here </a> to Login Again!!</h3></body></html>");
              } 
          }
          catch(SQLException ex){}            
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @paramrequest servlet request
     * @paramresponse servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @paramrequest servlet request
     * @paramresponse servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    @Override
    public void destroy()
    {
        try 
        {
            con.close();
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(AdminLoginVerify.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (NullPointerException ex){}
    }
}
