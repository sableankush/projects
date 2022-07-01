<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page
	import="com.banking.UploadProfilePhoto, java.sql.PreparedStatement, com.banking.DatabaseConnection, java.sql.Connection, java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/balance.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<title>State Bank of India</title>
</head>
<body>

<%
 String balance = request.getParameter("balance");

response.setHeader("Cache-control", "no-cache, no-store");
String username = (String) session.getAttribute("username");
String imageFileName = null;
imageFileName = "profilephoto.png";
Connection con = DatabaseConnection.getConnection();
PreparedStatement ps = con.prepareStatement("select profilephoto from customersecurity where username=?");
ps.setString(1, username);
ResultSet rs = ps.executeQuery();
while (rs.next()) {
	imageFileName = rs.getString("profilephoto");
}

if (imageFileName.equals("noimage")) {
	imageFileName = "profilephoto.png";
}
%>
<div id="container">
<div class="head">
<img id="logo" src="images/logo.png" alt="Logo">
<h id="heading">Online SBI Net Banking</h>
</div>
<div class="menu">
    <p><a href="userprofile.jsp">User Profile</a></p>
    <p><a href="logoutaccount.jsp">Logout</a></p>
</div>
<div class="separator"></div>
<div class="account">
    <div class="sidemenu">
        <img src="images/<%=imageFileName%>" alt="Profile Photo">
        <p id="pphoto">Profile Photo</p>
        <form action="UploadProfilePhoto" method="post" enctype="multipart/form-data">
            <div class="click"><label for="upload">Choose File</label></div>
            <input id="upload" type="file" name="profilephoto" accept="images/*" required>
            <input class="pic" type="submit" value="Upload">
        </form>
        <p class="link"><a href="checkgeneratepin.jsp">Add Money</a></p>
        <p class="link"><a href="viewbalance.jsp">View Balance</a></p>
        <p class="link"><a href="transfermoney.jsp">Transfer Money</a></p>
        <p class="link"><a href="accountstatement.jsp">Account Statement</a></p>
        <p class="link"><a href="userprofile.jsp">User Profile</a></p>
        <p class="link"><a href="logoutaccount.jsp">Logout</a></p>    
    </div>
    <div class="home">
        <div class="message">
        <h2>View Your Balance</h2>
        <p class="bal">Your Account Balance : <%= balance %> Rs.</p>

        <div class="back"><a href="home.jsp"><button class="design">Done</button></a></div>
    </div>
    </div>
</div>
<div class="footer"></div>
<div class="foothead">&copy State Bank of India (APM Id:Serv_Tran_564)</div>
</div>
</body>
</html>