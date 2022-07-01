<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="customer" class="com.customer.CustomerGetSet"></jsp:useBean>
<jsp:setProperty property="*" name="customer"/>

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

<% String username = customer.getUsername(); 
String otp = "otpverification.jsp?username="+username; 
%>

<div id="container">
<div class="head">
<img id="logo" src="images/logo.png" alt="Logo">
<h id="heading">Online SBI Net Banking</h>
</div>
<div class="account">
    <div class="mainform">
     <div class="error">
           <p>You Enter Wrong OTP. Please try to Enter Again.</p>
		   <div class="back"><a href="<%= otp %>"><button class="design">Generate</button></a></div>
	 </div>
	   
    </div>
<div class="footer"></div>
<div class="foothead">&copy State Bank of India (APM Id:Serv_Tran_564)</div>
</div>

</body>
</html>