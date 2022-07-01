package com.banking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.customer.CustomerGetSet;

public class LoginDAO {

	static Connection con = DatabaseConnection.getConnection();
    
	public static int loginCheck(CustomerGetSet user) {
		
		int status = 0;
		
		String username = user.getUsername();
		String password = user.getPassword();
		
		try {
			PreparedStatement  ps = con.prepareStatement ("select username, password from customersecurity");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String conusername = rs.getString("username");
				String conpassword = rs.getString("password");
				if(username.equals(conusername) && password.equals(conpassword)) {
					status = 1;
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;}
}
