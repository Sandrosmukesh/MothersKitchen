
package database;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DB 
{
    private DataSource getKitchenData() throws NamingException
    {
        Context c = new InitialContext();
        return (DataSource)c.lookup("mKitchenRef");
    }
    private Connection con;
    private DataSource ds;
    public Connection connectToDB()
    {
        try
        {
            ds = getKitchenData();
            con = ds.getConnection();
        }
        catch (NamingException ex)
        {
        }
        catch (SQLException ex)
        {            
        }
        return con;
    }
    
}
