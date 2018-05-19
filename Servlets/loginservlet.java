/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author shivam
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginservlet extends javax.servlet.http.HttpServlet
{
  public loginservlet() {}
  
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws java.io.IOException
  {
    try
    {
      java.io.PrintWriter pw = resp.getWriter();
      
      String username = req.getParameter("username");
      String email = req.getParameter("email");
      String password = req.getParameter("password");
      




      Class.forName("com.mysql.jdbc.Driver");
      
      Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");Throwable localThrowable3 = null;
      try { PreparedStatement ps = con.prepareStatement("select email,username from signup where email=? and password=?");
        ps.setString(1, email);
        ps.setString(2, password);
        
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
          System.out.println("hello");
          HttpSession session = req.getSession();
          session.setAttribute("username", rs.getString(2));
          session.setAttribute("email", rs.getString(1));
          resp.sendRedirect("profile1.jsp");
        }
        else
        {
          resp.sendRedirect("login.html");
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
