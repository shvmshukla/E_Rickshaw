import java.sql.PreparedStatement;

public class myservlet extends javax.servlet.http.HttpServlet {
  String username;
  String email;
  String password;
  String address;
  String phone;
  
  public myservlet() {}
  
  protected void service(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws java.io.IOException {
    username = req.getParameter("username");
    email = req.getParameter("email");
    password = req.getParameter("password");
    address = req.getParameter("address");
    phone = req.getParameter("phone");
    try
    {
      java.io.PrintWriter pw = resp.getWriter();
      





      Class.forName("com.mysql.jdbc.Driver");
      java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");Throwable localThrowable3 = null;
      try {
        PreparedStatement ps7 = con.prepareStatement("insert into signup values(?,?,?,?,?)");
        ps7.setString(1, username);
        ps7.setString(2, email);
        ps7.setString(3, password);
        ps7.setString(4, address);
        ps7.setString(5, phone);
        ps7.execute();
        resp.sendRedirect("front.html");
      }
      catch (Throwable localThrowable1)
      {
        localThrowable3 = localThrowable1;throw localThrowable1;



      }
      finally
      {



        if (con != null) if (localThrowable3 != null) try { con.close(); } catch (Throwable localThrowable2) { localThrowable3.addSuppressed(localThrowable2); } else con.close();
      }
    } catch (java.io.IOException|ClassNotFoundException|java.sql.SQLException e) { System.out.println(e);
    }
  }
}
