<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.banking.ViewMoney" %>  
    
<jsp:useBean id="user" class="com.customer.CustomerGetSet"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/addmoney.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<title>State Bank of India</title>
</head>
<body>

<%
String username = (String) session.getAttribute("username");
double balance = ViewMoney.view(user, username);

if(balance>0){
	String bal = "balance.jsp?balance="+balance;
	response.sendRedirect(bal);
}else{
	response.sendRedirect("viewerror.jsp");
}

%>

</body>
</html>