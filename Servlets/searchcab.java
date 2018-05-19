/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author shivam
 */
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class searchcab extends javax.servlet.http.HttpServlet
{
  public searchcab() {}
  
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws java.io.IOException
  {
    try
    {
      java.io.PrintWriter pw = resp.getWriter();
      
      String location = req.getParameter("location");
      int x = 0;
      
      Class.forName("com.mysql.jdbc.Driver");
      
      Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");Throwable localThrowable3 = null;
      try { PreparedStatement ps = con.prepareStatement("select no_of_autos from autostatus where location=? and no_of_autos>?");
        
        ps.setString(1, location);
        ps.setInt(2, x);
        

        ResultSet rs = ps.executeQuery();
        if (rs.next())
        {
          System.out.println("book");
          resp.sendRedirect("bookingdetails.jsp");
        }
        else
        {
          System.out.println("no booking");
          resp.sendRedirect("no_auto.html");
        }
      }
      catch (Throwable localThrowable1)
      {
        localThrowable3 = localThrowable1;throw localThrowable1;








      }
      finally
      {








        if (con != null) if (localThrowable3 != null) try { con.close(); } catch (Throwable localThrowable2) { localThrowable3.addSuppressed(localThrowable2); } else con.close();
      }
    } catch (ClassNotFoundException|java.sql.SQLException e) {
      System.out.println(e);
    }
  }
}
