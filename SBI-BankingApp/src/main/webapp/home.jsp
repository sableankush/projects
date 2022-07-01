<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="com.banking.UploadProfilePhoto, java.sql.PreparedStatement, com.banking.DatabaseConnection, java.sql.Connection, java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/home.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css?family=Stint+Ultra+Expanded"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Akaya+Telivigala&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/x-icon" href="images/favicon.png">
<title>State Bank of India</title>
</head>
<body>

	<%
	response.setHeader("Cache-control", "no-cache, no-store");
	String username = (String) session.getAttribute("username");

	if (username == null) {
		response.sendRedirect("loginaccount.jsp");
	}

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
			<p>
				<a href="userprofile.jsp">User Profile</a>
			</p>
			<p>
				<a href="logoutaccount.jsp">Logout</a>
			</p>
		</div>
		<div class="separator"></div>
		<div class="account">
			<div class="sidemenu">
				<img src="images/<%=imageFileName%>" alt="Profile Photo">
				<p id="pphoto">Profile Photo</p>
				<form action="UploadProfilePhoto" method="post" enctype="multipart/form-data">
					<div class="click">
						<label for="upload">Choose File</label>
					</div>
					<input id="upload" type="file" name="profilephoto" accept="images/*" required> <input
						type="hidden" name="username" value="<%=username%>"> <input
						type="submit" value="Upload">
				</form>
				<p class="link">
					<a href="checkgeneratepin.jsp">Add Money</a>
				</p>
				<p class="link">
					<a href="viewbalance.jsp">View Balance</a>
				</p>
				<p class="link">
					<a href="transfermoney.jsp">Transfer Money</a>
				</p>
				<p class="link">
					<a href="accountstatement.jsp">Account Statement</a>
				</p>
				<p class="link">
					<a href="userprofile.jsp">User Profile</a>
				</p>
				<p class="link">
					<a href="logoutaccount.jsp">Logout</a>
				</p>
			</div>
			<div class="home">
				<div class="message">
					<h2>
						Welcome to your SBI Account,
						<%=username%></h2>
					<p>State Bank of India is India's largest bank with a network
						of over 15000 branches and 5 associate banks located even in the
						remotest parts of India. State Bank of India (SBI) offers a wide
						range of banking products and services to corporate and retail
						customers.</p>

					<p>OnlineSBI is the Internet banking portal for State Bank of
						India. The portal provides anywhere, anytime, online access to
						accounts for State Bank's Retail and Corporate customers. The
						application is developed using the latest cutting edge technology
						and tools. The infrastructure supports unified, secure access to
						banking services for accounts in over 15,000 branches across
						India.</p>

					<p>By using Portal you can add Money in your Acccount, you can
						view your balanace and you can also transfer Money. If you want
						Account Summary/Account Statement, you can also get from this
						portal. The Profile Section provide all your Information with
						Account Number. We hope, you will Enjoy the services....! Thank
						you.</p>
				</div>
			</div>
		</div>
		<div class="footer"></div>
		<div class="foothead">&copy State Bank of India (APM
			Id:Serv_Tran_564)</div>
	</div>
</body>
</html>