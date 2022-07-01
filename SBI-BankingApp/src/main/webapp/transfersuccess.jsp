<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.banking.TransferMoney, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.Connection, com.banking.DatabaseConnection" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/error.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<title>State Bank of India</title>
</head>
<body>

<%
String reacc_no = request.getParameter("acc_no");
String confirmreacc_no = reacc_no.substring(6);
long confirmreacc_nofinal = Long.parseLong(confirmreacc_no);

String receiver_username;
Connection con = DatabaseConnection.getConnection();
PreparedStatement  ps = con.prepareStatement ("select username from customersecurity where acc_no=?");
ps.setLong(1, confirmreacc_nofinal);
ResultSet rs = ps.executeQuery();
while(rs.next()) {
	receiver_username = rs.getString("username");
	
}
%>
<div id="container">
<div class="head">
<img id="logo" src="images/logo.png" alt="Logo">
<h id="heading">Online SBI Net Banking</h>
</div>
<div class="account">
    <div class="mainform">
     <div class="error">
           <p>Money is transfer to the Account Number : <%= reacc_no%> successfully....!</p>
		   <div class="back"><a href="home.jsp"><button class="design">Done</button></a></div>
	 </div>
	   
    </div>
<div class="footer"></div>
<div class="foothead">&copy State Bank of India (APM Id:Serv_Tran_564)</div>
</div>

</body>
</html>