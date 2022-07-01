<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/loginaccount.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<title>State Bank of India</title>
</head>
<body>

<%

response.setHeader("Cache-control", "no-cache, no-store");
String username = (String)session.getAttribute("username");

if(username != null){
	response.sendRedirect("home.jsp");
}
%>

<div id="container">
<div class="head">
<img id="logo" src="images/logo.png" alt="Logo">
<h id="heading">Online SBI Net Banking</h>
</div>
<div class="menu">
    <p><a href="createaccount.jsp">New User</a></p>
</div>
<div class="account">
    <div class="decor">
        <div class="mainform">
            <form action="loginRequestHandler.jsp" method="post">
        
                <p class="form"><label for="username">Enter UserName</label></p>
                <input type="text" name="username" id="username" class="indcor" required>
        
                <p class="form"><label for="password">Enter Password</label></p>
                <input type="password" name="password" id="password" class="indcor" required>
        
                
                <p class="form"><input type="submit" value="Login" id="create"></p>
            </form>
            </div>
</div>
</div>
<div class="footer"></div>
<div class="foothead">&copy State Bank of India (APM Id:Serv_Tran_564)</div>
</div>
</body>
</html>