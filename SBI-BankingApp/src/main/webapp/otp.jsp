<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.banking.CreateAccount" %>  

<jsp:useBean id="customer" class="com.customer.CustomerGetSet"></jsp:useBean>
<jsp:setProperty property="*" name="customer"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/otp.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<title>State Bank of India</title>
</head>
<body>

<%
int i = CreateAccount.createAccountSecurity(customer);
String username = customer.getUsername();
if(i>0){
	String otp = "otpverification.jsp?username="+username;
	response.sendRedirect(otp);
}else{
	response.sendRedirect("usernameerror.html");
}
%>


</body>
</html>