<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/index.css" rel="stylesheet">
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
    <p><a href="loginaccount.jsp">Login</a></p>
</div>
<div class="account">
    <div class="decor">
    <div class="welcome"><h>Welcome to SBI Bank</h></div>
    <div class="button"><p class="open"><a href="createaccount.jsp"><button class="design">Create Account</button></a></p></div>
    <div class="button"><p class="open"><a href="loginaccount.jsp"><button class="design">Login Account</button></a></p></div>
</div>
</div>
<div class="footer"></div>
<div class="foothead">&copy State Bank of India (APM Id:Serv_Tran_564)</div>
</div>
</body>
</html>