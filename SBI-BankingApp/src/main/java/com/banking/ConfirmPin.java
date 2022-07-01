package com.banking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.customer.CustomerGetSet;

public class ConfirmPin {

	static Connection con = DatabaseConnection.getConnection();
	public static int confirm(CustomerGetSet user, String username) {
		
		int pin = user.getPin();
		int cpin = user.getCpin();
		long acc_no = 0;
		int status = 0;
		long conacc_no =0;
		
		if(pin == cpin) {
			try {
				PreparedStatement  ps = con.prepareStatement ("select acc_no from customersecurity where username=?");
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					acc_no = rs.getLong("acc_no"); 
				}
				
				PreparedStatement  ps2 = con.prepareStatement ("select acc_no from accountdata where username=?");
				ps2.setString(1, username);
				ResultSet rs2 = ps2.executeQuery();
				while(rs2.next()) {
					conacc_no = rs2.getLong("acc_no"); 
				}
				
				if(acc_no == conacc_no) {
					PreparedStatement  ps3 = con.prepareStatement ("update accountdata set pin=? where acc_no=?");
					ps3.setInt(1, pin);
					ps3.setLong(2, conacc_no);
					
					status = ps3.executeUpdate();
					
				}
				else {
					
				PreparedStatement  ps1 = con.prepareStatement ("insert into accountdata(acc_no, username, pin) values(?,?,?)");
				ps1.setLong(1, acc_no);
				ps1.setString(2, username);
				ps1.setInt(3, pin);
				status = ps1.executeUpdate();
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return status;
		
		
	}
}
