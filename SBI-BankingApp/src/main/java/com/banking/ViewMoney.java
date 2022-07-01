package com.banking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.customer.CustomerGetSet;

public class ViewMoney {
  
static Connection con = DatabaseConnection.getConnection();
	
	public static double view(CustomerGetSet user, String username) {
		
		int status = 0;
		long acc_no = 0;
		int pin = 0 ;
		double balance = 0; 
		try {
			
			PreparedStatement  ps = con.prepareStatement ("select acc_no, pin from accountdata where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				acc_no = rs.getLong("acc_no");
				pin = rs.getInt("pin");
			}
			
			int cpin = user.getPin();
			
			if(pin == cpin) {
			PreparedStatement  ps1 = con.prepareStatement ("select balance from accountdata where pin=?");
			ps1.setInt(1, user.getPin());
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()) {
				balance = rs1.getDouble("balance");
			}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return balance;
}
}
