package com.banking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.customer.CustomerGetSet;

public class TransferMoney {

	static Connection con = DatabaseConnection.getConnection();

	public static int transfer(CustomerGetSet user, String username) {
		
		int status = 0;
		int constatus = 0;
		long acc_no = 0;
		long conacc_no = 0;
		
		
		int pin = 0;
		pin = user.getPin();
		int repin = 0;
		int cpin = 0;
		
		double sender_balance = 0;
		double receiver_balance = 0;
		
		String reusername = null;
		

		try {
			
			String reacc_no = user.getReacc_no();
			String confirmreacc_no = reacc_no.substring(6);
			long confirmreacc_nofinal = Long.parseLong(confirmreacc_no);
			
			PreparedStatement  ps7 = con.prepareStatement ("select acc_no from customersecurity where username=?");
			ps7.setString(1, username);
			ResultSet rs7 = ps7.executeQuery();
			while(rs7.next()) {
				conacc_no = rs7.getLong("acc_no");
			}
			
			if(confirmreacc_nofinal != conacc_no) {
			PreparedStatement  ps5 = con.prepareStatement ("select balance, pin from accountdata where username=?");
			ps5.setString(1, username);
			ResultSet rs3 = ps5.executeQuery();
			while(rs3.next()) {
				sender_balance = rs3.getDouble("balance");
				cpin = rs3.getInt("pin");
				
			}
			
			
			if(sender_balance > user.getAmount() && (pin == cpin)) {

			PreparedStatement  ps = con.prepareStatement ("select username from customersecurity where acc_no=?");
			ps.setLong(1, confirmreacc_nofinal);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				reusername = rs.getString("username");
				
			}
            
            
			PreparedStatement  ps1 = con.prepareStatement ("select pin from accountdata where username=?");
			ps1.setString(1, reusername);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()) {
				repin = rs1.getInt("pin");
			}
			
			
			if(repin>0) {

				PreparedStatement  ps2 = con.prepareStatement ("select balance from accountdata where username=?");
				ps2.setString(1, reusername);
				ResultSet rs2 = ps2.executeQuery();
				while(rs2.next()) {
					receiver_balance = rs2.getDouble("balance");
				}
				

				receiver_balance = receiver_balance + user.getAmount();
				PreparedStatement  ps3 = con.prepareStatement ("update accountdata set balance=? where username=?");
				ps3.setDouble(1, receiver_balance);
				ps3.setString(2, reusername);
				status = ps3.executeUpdate();
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();
                String date_time = dtf.format(now);
                
                PreparedStatement  ps8 = con.prepareStatement ("insert into statement(acc_no, sender_acc_no, receiver_acc_no, sender_username, receiver_username, amount, date_time, transaction) values(?,?,?,?,?,?,?,?)");
				ps8.setLong(1, conacc_no);
                ps8.setLong(2, conacc_no);
				ps8.setLong(3, confirmreacc_nofinal);
				ps8.setString(4, username);
				ps8.setString(5, reusername);
				ps8.setDouble(6, user.getAmount());
				ps8.setString(7, date_time);
				ps8.setString(8, "debited");
				status = ps8.executeUpdate();
				
				PreparedStatement  ps10 = con.prepareStatement ("insert into statement(acc_no, sender_acc_no, receiver_acc_no, sender_username, receiver_username, amount, date_time, transaction) values(?,?,?,?,?,?,?,?)");
				ps10.setLong(1, confirmreacc_nofinal);
                ps10.setLong(2, conacc_no);
				ps10.setLong(3, confirmreacc_nofinal);
				ps10.setString(4, username);
				ps10.setString(5, reusername);
				ps10.setDouble(6, user.getAmount());
				ps10.setString(7, date_time);
				ps10.setString(8, "credited");
				status = ps10.executeUpdate();
				
			}
			else {
				
				receiver_balance = receiver_balance + user.getAmount();
				PreparedStatement  ps4 = con.prepareStatement ("insert into accountdata(acc_no, username, balance) values(?,?,?)");
				ps4.setLong(1, confirmreacc_nofinal);
				ps4.setString(2, reusername);
				ps4.setDouble(3, receiver_balance);
				status = ps4.executeUpdate();
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();
                String date_time = dtf.format(now);
                
                PreparedStatement  ps8 = con.prepareStatement ("insert into statement(acc_no, sender_acc_no, receiver_acc_no, sender_username, receiver_username, amount, date_time, transaction) values(?,?,?,?,?,?,?,?)");
				ps8.setLong(1, conacc_no);
                ps8.setLong(2, conacc_no);
				ps8.setLong(3, confirmreacc_nofinal);
				ps8.setString(4, username);
				ps8.setString(5, reusername);
				ps8.setDouble(6, user.getAmount());
				ps8.setString(7, date_time);
				ps8.setString(8, "debited");
				status = ps8.executeUpdate();
				
				PreparedStatement  ps10 = con.prepareStatement ("insert into statement(acc_no, sender_acc_no, receiver_acc_no, sender_username, receiver_username, amount, date_time, transaction) values(?,?,?,?,?,?,?,?)");
				ps10.setLong(1, confirmreacc_nofinal);
                ps10.setLong(2, conacc_no);
				ps10.setLong(3, confirmreacc_nofinal);
				ps10.setString(4, username);
				ps10.setString(5, reusername);
				ps10.setDouble(6, user.getAmount());
				ps10.setString(7, date_time);
				ps10.setString(8, "credited");
				status = ps10.executeUpdate();
			}
			}
			
			if(status>0) {
				sender_balance = sender_balance - user.getAmount();
				PreparedStatement  ps6 = con.prepareStatement ("update accountdata set balance=? where username=?");
				ps6.setDouble(1, sender_balance);
				ps6.setString(2, username);
				constatus = ps6.executeUpdate();
			}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}


		return constatus;
	}
}
