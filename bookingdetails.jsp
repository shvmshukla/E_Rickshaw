<%@page import="java.sql.*" %>

<html>
<head>

<title>Global Cab service ..</title>
<link href="style.css" rel="stylesheet" type="text/css">

<div id="top_links">
  

<div id="header">
	<h1>E-RICKSHAW<span class="style1"></span></h1>
    <h2>ExtraOrdinary Service</h2>	
   
</div>

<div id="navigation">
    <ul>
    
    <li><a href="gallery.html">GALLERY</a></li>
    <li><a href="help.html">HELP</a></li>
    <li><a href="login.html">LOGOUT</a></li>
    </ul>
</div>
 <%
     
            String email = (String)session.getAttribute("email");
            String location = request.getParameter("location");
 
 %>
          <%out.println(email);%>
        

       <form action="bookservlet.jsp" >
    	    <table  align="center" bgcolor="white" cellspacing="5" cellpadding="10">
               		
					<tr><td><h4>Enter your details:........................................................................</h4></td></td></tr>
                                        <tr><td>EMAIL:</td><td> <input type="text" name="email" readonly="" value="<%=email%>"</td></tr>
					<tr><td>NAME:</td><td> <input type="text" name="cname" required="enter"</td></tr>
                                        <tr><td>SOURCE:</td><td> <input type="text" name="source" required="enter"</td></tr>
                                        <tr><td>PICKUP POINT:</td><td> <input type="text" name="pickup" </td></tr>
                                        <tr><td>DESTINATION:</td><td> <input type="text" name="destination" required="enter"</td></tr>
                                        <tr><td>phone:</td><td> <input type="text" name="phone" required="enter"</td></tr>
                                        <tr><td>DATE (on which date service is required):</td><td> <input type="date" name="date" required="enter"</td></tr>
                                        <tr><td>TIME((at which time service is required)):</td><td> <input type="time" name="time" required="enter"</td></tr>
					<tr><td><input type="submit" value="book rickshaw" name="click"</td><td><input type="reset" value="reset"</td></tr>
   
            </table>
       </form>   
		<center><br><br><a href="profile1.jsp" ><b>   <img src="back.png" height="40" title="back"></b> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="logout.jsp"><img src="logout.png" height="40" title="logout"></a></center>                                                  
	
    	   </div>
    

            	
    

    
 
    

</body>
</html>