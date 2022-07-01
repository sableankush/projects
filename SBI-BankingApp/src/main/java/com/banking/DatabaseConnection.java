package com.banking;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	static Connection con;
	
	public static Connection getConnection() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "Bank", "Sablenitin25@");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return con;

	}
}
