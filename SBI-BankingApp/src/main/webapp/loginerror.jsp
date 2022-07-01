<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="user" class="com.customer.CustomerGetSet"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/otperror.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<title>State Bank of India</title>
</head>
<body>

<% String username = user.getUsername(); 
String login = "loginaccount.jsp?username="+username; 
%>

<div id="container">
<div class="head">
<img id="logo" src="images/logo.png" alt="Logo">
<h id="heading">Online SBI Net Banking</h>
</div>
<div class="account">
    <div class="mainform">
     <div class="error">
           <p>You Enter Wrong UserName or Password. Please try to Enter Again.</p>
		   <div class="back"><a href="<%= login %>"><button class="design">Back</button></a></div>
	 </div>
	   
    </div>
<div class="footer"></div>
<div class="foothead">&copy State Bank of India (APM Id:Serv_Tran_564)</div>
</div>

</body>
</html>