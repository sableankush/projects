package com.banking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;

import com.customer.CustomerGetSet;

public class AddMoney {

	static Connection con = DatabaseConnection.getConnection();

	public static int add(CustomerGetSet user, String username) {

		int status = 0;
		long acc_no = 0;
		int pin = 0;
		double balance = 0;
		long sender_acc_no = 0 ;
		int cpin = user.getPin();
		try {

			PreparedStatement  ps = con.prepareStatement ("select pin from accountdata where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				pin = rs.getInt("pin");
			}

			if(pin == cpin) {

				PreparedStatement  ps1 = con.prepareStatement ("select acc_no, balance from accountdata where username=?");
				ps1.setString(1, username);
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()) {
					acc_no = rs1.getLong("acc_no");
					balance = rs1.getDouble("balance");
				}

				balance = balance + user.getAmount();
				PreparedStatement  ps2 = con.prepareStatement ("update accountdata set balance=? where acc_no=?");
				ps2.setDouble(1, balance);
				ps2.setLong(2, acc_no);
				status = ps2.executeUpdate();

				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();
                String date_time = dtf.format(now);

				PreparedStatement  ps3 = con.prepareStatement ("insert into statement(acc_no, sender_acc_no, sender_username, amount, date_time, transaction) values(?,?,?,?,?,?)");
				ps3.setLong(1, acc_no);
				ps3.setLong(2, acc_no);
				ps3.setString(3, username);
				ps3.setDouble(4, user.getAmount());
				ps3.setString(5, date_time);
				ps3.setString(6, "credited");
				status = ps3.executeUpdate();



			}


		}
		catch(Exception e) {
			e.printStackTrace();
		}


		return status;

	}

}
