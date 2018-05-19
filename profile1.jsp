<html>
<head>
<title>Global cab service ..</title>
<link href="style.css" rel="stylesheet" type="text/css">

</head>

<body>
<div id="top_links">
  

<div id="header">
	<h1>E-RICKSHAW<span class="style1"></span></h1>
    <h2>ExtraOrdinary Service</h2>	

</div>

<div id="navigation">
    <ul>
        <li><a href="bookcab.html">BOOK RICKSHAW</a></li>
    <li><a href="cancelcab.jsp">CANCEL RICKSHAW</a></li>
    <li><a href="edit.jsp">EDIT PROFILE</a></li>
    <li><a href="login.html">LOGOUT</a></li>
    </ul>
</div>

<table cellpadding="0" cellspacing="0" id="content1"><tr align="justify">
	
    
</tr></table>

<table style="width:897px; background:#FFFFFF; margin:0 auto;"><tr align="justify">
	
    <td width="299" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
            <%
            String username = (String)session.getAttribute("username");
           // out.println(username);
            %>
		    <p><h3> Welcome <% out.println(username);%>!!! <br>
                        Avail us !!!</h3></p>
	    	
	    </div>      
    </td>
    
    
</tr></table>


</body>
</html>
