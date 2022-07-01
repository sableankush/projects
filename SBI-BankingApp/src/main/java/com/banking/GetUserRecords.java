package com.banking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.customer.CustomerGetSet;

public class GetUserRecords {

	static Connection con = DatabaseConnection.getConnection();
	public static List<CustomerGetSet> getAllRecords(String username){

		List<CustomerGetSet> list = new ArrayList<CustomerGetSet>();
		long acc_no = 0;

		try {

			PreparedStatement  ps = con.prepareStatement ("select acc_no from customersecurity where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				acc_no = rs.getLong("acc_no");
			}


			PreparedStatement  ps1 = con.prepareStatement ("select * from customerdetails where acc_no=?");
			ps1.setLong(1, acc_no);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()) {
				CustomerGetSet user = new CustomerGetSet();
				user.setAcc_no(rs1.getLong("acc_no"));
				user.setFname(rs1.getString("fname"));
				user.setLname(rs1.getString("lname"));
				user.setEmail(rs1.getString("email"));
				user.setDob(rs1.getString("dob"));
				user.setNumber(rs1.getString("number"));
				user.setAddress(rs1.getString("address"));
				user.setCity(rs1.getString("city"));
				user.setState(rs1.getString("state"));
				user.setZipcode(rs1.getString("zipcode"));
				list.add(user);
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}


		return list;

	}

	public static List<CustomerGetSet> getSecurityRecords(String username){

		List<CustomerGetSet> list1 = new ArrayList<CustomerGetSet>();
		long acc_no = 0;

		try {

			PreparedStatement  ps = con.prepareStatement ("select acc_no from customersecurity where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				acc_no = rs.getLong("acc_no");
			}


			PreparedStatement  ps1 = con.prepareStatement ("select * from customersecurity where acc_no=?");
			ps1.setLong(1, acc_no);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()) {
				CustomerGetSet user = new CustomerGetSet();
				user.setUsername(rs1.getString("username"));
				user.setPassword(rs1.getString("password"));
				list1.add(user);
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}


		return list1;

	}
}
