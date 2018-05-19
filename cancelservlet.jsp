

<%@page import="java.io.*"%>
<%@page import="java.sql.*" %>



<html>
 
 <head>
 </head>
 <body>
  <link href="style1.css" rel="stylesheet" type="text/css">
  <%
       
   String  username,pickup,phone,address,email,date,time,name,source,destination,click,driver_name,rickshaw_no,driver_contact_no;
   String distance="",cost="",drivername="",autono="",dcontactno=""; 
   int min =1,num=0,new_status ;
   email = request.getParameter("email");
   date = request.getParameter("date");
   destination= request.getParameter("destination");
 //  name = request.getParameter("cname");
   source = request.getParameter("source");
   time = request.getParameter("time");
   phone = request.getParameter("phone");
   
   driver_name = request.getParameter("dname");
   rickshaw_no = request.getParameter("rickshawno");
   driver_contact_no = request.getParameter("dphone");
   
    
  
  try{
   Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", ""); 

  
   String s="delete from admin1 where email=? and source=? and destination=? and phone=? and date=? and time=? dname=? and autono=?";
   System.out.println(s); 
   
   PreparedStatement ps6 =con.prepareStatement("delete from admin1 where email=? and source=? and destination=? and phone=? and date=? and time=? and dname=? and autono=?");
                 ps6.setString(1,email);
                // ps6.setString(2,name);
                 ps6.setString(2,source);
                 ps6.setString(3,destination);
                 ps6.setString(4,phone);
                 ps6.setString(5,date);
                 ps6.setString(6,time);
                 ps6.setString(7,driver_name);
                 ps6.setString(8,rickshaw_no);
                 ps6.executeUpdate();
  
  }catch(Exception e){
  System.out.println(e);
  
  }
   
 %> 
  <br><br><br><br><br><br><br><br><br><br><br><br>
  
   
  
   <center>regret</center><br><br><br><br>
 
 
   <center>
         <table border="2" cellpadding="3">
        <tr><td><br><center> ....................................BOOKING CANCELLED.............................. <br></center></td></tr>
        </table></center>
  <hr>
                              
                                        
           <center><br><br><br><br><br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="login.html"><img src="logout.png" height="40" title="logout"></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="front.html" ><b>HOME</b> </center>                             
 
 <%
                                        
  // out.println(distance);
  //out.println(name);
  out.println(source);
  out.println(destination);
  out.println(date);
  out.println(time);
 // out.println(pickup);
  out.println(phone);
  out.println(email);
  out.println(driver_name);
  out.println(rickshaw_no);
 
 %>  
  
 </body>
</html>

