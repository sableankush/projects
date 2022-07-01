<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
        <img src="images/profilephoto.png" alt="Profile Photo">
        <p id="pphoto">Profile Photo</p>
        <form action="photo.jsp" method="post">
            <div class="click"><label for="upload">Choose File</label></div>
            <input id="upload" type="file" name="profilephoto" accept="image/*">
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
        <h2>Generate Your Four Digit Pin</h2>
        <form action="confirmpin.jsp" method="post"> 

	    <p class="form"><label for="pin">Generate Four Digit Pin</label></p>
	    <input type="number" name="pin" id="pin" class="indcor" required>

        <p class="form"><label for="cpin">Confirm Your Pin</label></p>
	    <input type="number" name="cpin" id="cpin" class="indcor" required>

        <p class="form"><input type="submit" value="Generate" id="create"></p>

        </form>
    </div>
    </div>
</div>
<div class="footer"></div>
<div class="foothead">&copy State Bank of India (APM Id:Serv_Tran_564)</div>
</div>
</body>
</html>