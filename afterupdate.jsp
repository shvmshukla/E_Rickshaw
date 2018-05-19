<%@page import="java.io.*"%>
<%@page import="java.sql.*" %>



<html>
 
 <head>
 </head>
 <body>
  <link href="style1.css" rel="stylesheet" type="text/css">
  <%
       
   String  username,phone,address,email;
    
   email = request.getParameter("email");
   phone = request.getParameter("phone");
   username = request.getParameter("username");
   address= request.getParameter("address");
   

   Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", ""); 

   PreparedStatement ps = con.prepareStatement("update signup set username=?,address=?,phone=? where email=?");
   System.out.println("update signup set username='"+username+"',address='"+address+"',phone='"+phone+"' where email='"+email+"'");
   ps.setString(4, email);
   ps.setString(1, username);
   ps.setString(2,address );
   ps.setString(3,phone );
      
   int x=ps.executeUpdate();
   
  if(x==1)
  {
   //String status= "upadated";
  }
   
  
  %>
  <br><br><br><br><br><br><br><br><br><br><br><br>
         <table border="10" cellpadding="10">
        <tr><td><br><center> <br>Your details are updated successfully </center></td></tr>
        </table>
  
 </body>
</html>
