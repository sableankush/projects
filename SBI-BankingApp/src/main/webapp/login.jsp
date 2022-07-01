<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.banking.CreateAccount, com.banking.DatabaseConnection, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>  

<jsp:useBean id="customer" class="com.customer.CustomerGetSet"></jsp:useBean>
<jsp:setProperty property="*" name="customer"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<title>State Bank of India</title>
</head>
<body>

<%
int i = CreateAccount.otpverification(customer);
String username = customer.getUsername();
if(i>0){
	Connection con = DatabaseConnection.getConnection();
	
	PreparedStatement  ps3 = con.prepareStatement ("select acc_no from customerdetails");
	ResultSet rs2 = ps3.executeQuery();
	
	while(rs2.next()){
		long acc_no1 = rs2.getLong("acc_no");
		PreparedStatement  ps4 = con.prepareStatement ("select acc_no from customersecurity");
		ResultSet rs3 = ps4.executeQuery();
		
		while(rs3.next()){
			long acc_no2 = rs3.getLong("acc_no");
			if(acc_no1 == acc_no2){
				PreparedStatement  ps5 = con.prepareStatement ("delete from customersecurity where otp=?");
				ps5.setString(1, "delete");
				ps5.executeUpdate();
			}
			
		}
	}
	
	PreparedStatement  ps = con.prepareStatement ("select acc_no from customerdetails");
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()){
		long acc_no1 = rs.getLong("acc_no");
		try{
	    PreparedStatement  ps2 = con.prepareStatement ("delete from customerdetails where acc_no=?");
		ps2.setLong(1, acc_no1);
		ps2.executeUpdate();
		}
		catch(Exception e){
			continue;
		}
		}
	
	response.sendRedirect("welcome.html");
	}else{
    String username1 = "otperror.jsp?username="+username;
	response.sendRedirect(username1);
}
%>

</body>
</html>