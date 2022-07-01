package com.banking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.customer.CustomerGetSet;

public class GetUserStatement {

	static Connection con = DatabaseConnection.getConnection();
	public static List<CustomerGetSet> getAllRecords(String username){

		List<CustomerGetSet> list = new ArrayList<CustomerGetSet>();
		long acc_no = 0;
        int i = 1;
		try {

			PreparedStatement  ps = con.prepareStatement ("select acc_no from customersecurity where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				acc_no = rs.getLong("acc_no");
			}


			PreparedStatement  ps1 = con.prepareStatement ("select * from statement where acc_no=?");
			ps1.setLong(1, acc_no);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()) {
				CustomerGetSet user = new CustomerGetSet();
				user.setSr_no(i);
				user.setSender_acc_no(rs1.getLong("sender_acc_no"));
				user.setReceiver_acc_no(rs1.getLong("receiver_acc_no"));
				user.setSender_username(rs1.getString("sender_username"));
				user.setReceiver_username(rs1.getString("receiver_username"));
				user.setAmount(rs1.getDouble("amount"));
				user.setDate_time(rs1.getString("date_time"));
				user.setTransaction(rs1.getString("transaction"));
				list.add(user);
				i++;
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}


		return list;

	}
}
