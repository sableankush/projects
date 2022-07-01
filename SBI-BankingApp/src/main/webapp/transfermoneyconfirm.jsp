<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.banking.TransferMoney, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.Connection, com.banking.DatabaseConnection" %>     
    
<jsp:useBean id="user" class="com.customer.CustomerGetSet"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/generatepin.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<title>State Bank of India</title>
</head>
<body>

<%
String username = (String) session.getAttribute("username");

String receiveracc_no = user.getReacc_no();

int i = TransferMoney.transfer(user, username);

if(i>0){
	String success = "transfersuccess.jsp?acc_no="+receiveracc_no;
	response.sendRedirect(success);
}else{
	response.sendRedirect("transfererror.jsp");
}

%>

</body>
</html>