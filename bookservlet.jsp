<%@page import="java.io.*"%>
<%@page import="java.sql.*" %>



<html>
 
 <head>
 </head>
 <body>
  <link href="style1.css" rel="stylesheet" type="text/css">
  <%
       
   String  username,pickup,phone,address,email,date,time,name,source,destination,click;
   String distance="",cost="",drivername="",autono="",dcontactno=""; 
   int min =1,num=0,new_status ;
   email = request.getParameter("email");
   phone = request.getParameter("phone");
   date = request.getParameter("date");
   destination= request.getParameter("destination");
   name = request.getParameter("cname");
   source = request.getParameter("source");
   time = request.getParameter("time");
   phone = request.getParameter("phone");
   click = request.getParameter("click");
   pickup = request.getParameter("pickup");
  
  
  try{
   Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", ""); 

   PreparedStatement ps = con.prepareStatement("select distance,cost from distance where source=? and destination=?");
   
  ps.setString(1,source);
  ps.setString(2,destination);
      
   ResultSet rs =ps.executeQuery();
   //  distance=rs.getString(3);
   //out.println(distance);
   //out.println(distance);
   
     if(rs.next()){
       distance=rs.getString("distance");
     out.println("distance "+distance);
     //out.println(rs.getString("distance"));
    cost=rs.getString("cost");
     out.println("cost "+cost);
     //out.println(rs.getString("cost"));
    
     }
     PreparedStatement ps3 = con.prepareStatement("select min(pno) from cabdetails where location=?");
    ps3.setString(1,source);
    ResultSet rs3 =ps3.executeQuery();
    if(rs3.next()){
   
   min = rs3.getInt(1);
   out.println("------"+min);
    }
   
   PreparedStatement ps1 = con.prepareStatement("select dname,dcontactno,autono from cabdetails where pno=? and location=?");
   ps1.setInt(1, min);
   ps1.setString(2,source);
   ResultSet rs1 =ps1.executeQuery();
    if(rs1.next()){
   
   drivername = rs1.getString("dname");
   autono = rs1.getString("autono");
   dcontactno = rs1.getString("dcontactno");
    
   out.println(drivername);
    
    }
    
   
    
   PreparedStatement ps2 = con.prepareStatement("delete from cabdetails where pno=? and location=?");
   ps2.setInt(1,min);
   ps2.setString(2,source);
   ps2.executeUpdate();
   
   PreparedStatement ps4 = con.prepareStatement("select no_of_autos from autostatus where location=?");
    ps4.setString(1,source);
    ResultSet rs4 =ps4.executeQuery();
    if(rs4.next()){
   
   num = rs4.getInt(1);
   
   out.println("no of autos "+num);
    }
    new_status = num-1 ;
    out.println("new status "+new_status) ;
    PreparedStatement ps5 = con.prepareStatement("update autostatus set no_of_autos=? where location=?");
   ps5.setInt(1,new_status);
   ps5.setString(2,source);
   ps5.executeUpdate();
   
   
   PreparedStatement ps6 =con.prepareStatement("insert into admin1 values(?,?,?,?,?,?,?,?,?)");
                 ps6.setString(1,email);
                 ps6.setString(2,name);
                 ps6.setString(3,source);
                 ps6.setString(4,destination);
                 ps6.setString(5,phone);
                 ps6.setString(6,date);
                 ps6.setString(7,time);
                 ps6.setString(8,drivername);
                 ps6.setString(9,autono);
                 ps6.execute();
  
  }catch(Exception e){
  System.out.println(e);
  
  }
   
  %>
  <br><br><br><br><br><br><br><br><br><br><br><br>
<center>THANKS FOR USING ERICKSHAW</center><br><br><br><br>
 <center>
         <table border="2" cellpadding="3">
        <tr><td><br><center> ....................................INVOICE.............................. <br></center></td></tr>
        </table></center>
  <hr>
   <table  align="center" bgcolor="white" cellspacing="3" cellpadding="2" border="1" title="customer inputs">
            
                                        <tr><td>CUSTOMER NAME:</td><td> <input type="text" value="<%=name%>"   border="0" /> </td></tr>
                                        <tr><td>EMAIL:</td><td> <input type="text" name="email" readonly="" value="<%=email%>"   border="0" /> </td></tr>
					<tr><td>SOURCE:</td><td> <input type="text" name="source" value="<%=source%>" /></td></tr>
					<tr><td>DESTINATION:</td><td> <input type="text" name="destination" value="<%=destination%>"/></td></tr>
                                        <tr><td>PICKUP POINT:</td><td> <input type="text" name="pickup" value="<%=pickup%>"/></td></tr>
                                        <tr><td>CONTACT NO:</td><td> <input type="text" name="phone" value="<%=phone%>"/></td></tr>
                                        <tr><td>DATE:</td><td> <input type="text" name="date" value="<%=date%>"/></td></tr>
                                        <tr><td>TIME:</td><td> <input type="text" name="time" value="<%=time%>"/></td></tr>
                                        
   
        </table>
   <hr>                                     
    <table  align="center" bgcolor="white" cellspacing="3" cellpadding="2" border="1" title="erickshaw outputs">
            
                                        <tr><td>DRIVER NAME:</td><td> <input type="text" value="<%out.println(drivername);%>"   border="0" /> </td></tr>
                                        <tr><td>RICKSHAW NO:</td><td> <input type="text" name="phone" value="<%out.println(autono);%>"/></td></tr>
                                        <tr><td>DRIVER CONTACT NO:</td><td> <input type="text" name="phone" value="<%out.println(dcontactno);%>"/></td></tr>
                                        <tr><td>DISTANCE:</td><td> <input type="text" name="date" value="<%out.println(distance);%>"/></td></tr>
                                        <tr><td>COST:</td><td> <input type="text" name="time" value="<%out.println(cost);%>"/></td></tr>
                                        
   
        </table>                                    
                              
                                        
           <center><br><br><br><br><br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="login.html"><img src="logout.png" height="40" title="logout"></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="front.html" ><b>HOME</b> </center>                             
 
 <%
                                        /*
  // out.println(distance);
  out.println(name);
  out.println(source);
  out.println(destination);
  out.println(date);
  out.println(time);
  out.println(pickup);
  out.println(phone);
  out.println(email);
 */ 
 %>  
  
 </body>
</html>

