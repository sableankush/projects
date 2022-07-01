<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.banking.CreateAccount" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/customeraccount.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<title>State Bank of India</title>
</head>
<body>

<%@ page import = "com.banking.CreateAccount, com.customer.CustomerGetSet, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
long acc_no = CreateAccount.getAccountNumber();
%>

<div id="container">
<div class="head">
<img id="logo" src="images/logo.png" alt="Logo">
<h id="heading">Online SBI Net Banking</h>
</div>
<div class="account">
    <div class="mainform">
    <form action="otp.jsp" method="post">

	    <p class="form"><label for="accountNumber">Your Account Number</label></p>
	    <input type="text" name="confirmacc_no" value="SBIN00<%= acc_no %>" id="accountNumber" class="indcor" readonly>

	    <p class="form"><label for="username">Enter Unique UserName</label></p>
	    <input type="text" name="username" id="username" class="indcor" required placeholder="Ankush@123">
	
	    <p class="form"><label for="password">Enter Password</label></p>
	    <input type="password" name="password" id="password" class="indcor" required placeholder="Sableankush25@">

        <p class="form"><label for="conpassword">Enter Confirm Password</label></p>
	    <input type="password" name="conpassword" id="conpassword" class="indcor" required placeholder="Sableankush25@">
        
        <p class="form"><input type="submit" value="Continue" id="create"></p>
    </form>
    </div>
</div>
<div class="footer"></div>
<div class="foothead">&copy State Bank of India (APM Id:Serv_Tran_564)</div>
</div>

</body>
</html>