package com.banking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.customer.CustomerGetSet;

public class CheckGeneratePin {

	static Connection con = DatabaseConnection.getConnection();
	public static int check(String username) {

		int status = 0;
		int pin = 0;
		long acc_no = 0;
		try {

			PreparedStatement  ps = con.prepareStatement ("select acc_no from customersecurity where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				acc_no = rs.getLong("acc_no"); 
			}

			PreparedStatement  ps1 = con.prepareStatement ("select pin from accountdata where acc_no=?");
			ps1.setLong(1, acc_no);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()) {
				pin = rs1.getInt("pin");
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return pin;

	}
}
