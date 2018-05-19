
<%@page import="java.sql.*"%>
<html>
    <link href="style1.css" rel="stylesheet" type="text/css">
    <head>
        
        
      <%
          Class.forName("com.mysql.jdbc.Driver");
           
         String email = (String)session.getAttribute("email");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", ""); 
                 PreparedStatement ps =con.prepareStatement("select * from signup where email=?");
                 ps.setString(1,email);
                 ResultSet rs=ps.executeQuery();
      %> 
    </head>
    <body>
    <br><br><br><br><br><br><br>
    <form action="afterupdate.jsp">   
        <% if(rs.next()){ %>
        <table  align="center" bgcolor="white" cellspacing="3" cellpadding="2" border="1" title="ENTER NEW DETAILS">
            <br><br><br> <center><tr><td><B>UPDATE YOUR INFORMATION HERE .........................</B></td></tr></center>>
                                        <tr><td>USERNAME:</td><td> <input type="text" name="username" value="<%=rs.getString(1)%>"   border="0" /> </td></tr>
                                        <tr><td>EMAIL:</td><td> <input type="text" name="email" readonly="" value="<%=rs.getString(2)%>"   border="0" /> </td></tr>
					<tr><td>ADDRESS:</td><td> <input type="text" name="address" value="<%=rs.getString(4)%>" /></td></tr>
					<tr><td>PHONE:</td><td> <input type="text" name="phone" value="<%=rs.getString(5)%>"/></td></tr>
                                        <tr><td><input type="submit" value="update" /></td><td><input type="text" value="">"</td></tr>
   
        </table>                                        
    </form>  
       <% } %>
    <center><br><a href="profile1.jsp" ><b>   <img src="back.png" height="40" title="back"></b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <a href="login.html"><img src="logout.png" height="40" title="logout"></center>
    </body>
    </html>