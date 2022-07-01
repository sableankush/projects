package com.banking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.customer.CustomerGetSet;

public class CreateAccount {

	static Connection con = DatabaseConnection.getConnection();
    static  long acc_not;
	public static int createAccount(CustomerGetSet customer) {
        
		ArrayList<Long> list = new ArrayList<Long>(); 
		
		int status = 0;
		try {
			long acc_no = 1;
			PreparedStatement  ps = con.prepareStatement ("select acc_no from customerdetails");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getLong("acc_no"));
			}
			Collections.sort(list);  
			for(long i : list) {
				if(acc_no == i) {
					acc_no++;
				}
			}


			PreparedStatement  ps1 = con.prepareStatement ("insert into customerdetails values (?,?,?,?,?,?,?,?,?,?)");
			ps1.setLong(1, acc_no);
			ps1.setString(2, customer.getFname());
			ps1.setString(3, customer.getLname());
			ps1.setString(4, customer.getEmail());
			ps1.setString(5, customer.getDob());
			ps1.setString(6, customer.getNumber());
			ps1.setString(7, customer.getAddress());
			ps1.setString(8, customer.getCity());
			ps1.setString(9, customer.getState());
			ps1.setString(10, customer.getZipcode());
			status = ps1.executeUpdate();
			
			acc_not = acc_no;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return status;

	}
	
	public static long getAccountNumber(){

		long ac_no = acc_not;
		
		return ac_no;
	}


	public static int createAccountSecurity(CustomerGetSet customer) {

		int status = 0;
		try {

			if(customer.getPassword().equals(customer.getConpassword())) {
				PreparedStatement  ps1 = con.prepareStatement ("insert into customersecurity(acc_no, username, password) values (?,?,?)");
				String acc_no = customer.getConfirmacc_no();
				String confirmacc_no = acc_no.substring(6);
				long confirmacc_nofinal = Long.parseLong(confirmacc_no);
				ps1.setLong(1, confirmacc_nofinal);
				ps1.setString(2, customer.getUsername());
				ps1.setString(3, customer.getPassword());

				status = ps1.executeUpdate();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;

	}
	
	public static int otpverification(CustomerGetSet customer) {
		int status = 0;
		String username = customer.getUsername();
		String otpgenerate = new String();
		otpgenerate = customer.getOtp();
		String otpconfirm =new String();
		otpconfirm = customer.getConotp();
		
		if(otpgenerate.equals(otpconfirm)) {
			try {
			PreparedStatement  ps1 = con.prepareStatement ("update customersecurity set otp=? where username=?");
			ps1.setString(1, otpconfirm);
			ps1.setString(2, username);
			status = ps1.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return status;
		
	}
}
