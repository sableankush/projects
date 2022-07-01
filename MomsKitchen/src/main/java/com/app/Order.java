package com.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Order extends HttpServlet {
	
	static Connection c = null;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String sareacode = request.getParameter("areacode");
		int areacode = Integer.parseInt(sareacode);		
		String snumber = request.getParameter("number");
		long number = Long.parseLong(snumber);
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String szipcode = request.getParameter("zipcode");
		int zipcode = Integer.parseInt(szipcode);
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String details = request.getParameter("details");
		String sserve = request.getParameter("serve");
		int serve = Integer.parseInt(sserve);
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery", "Bakery", "Sablenitin25@");
			
			PreparedStatement prst = c.prepareStatement("insert into orders values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			prst.setString(1, firstname);
			prst.setString(2, lastname);
			prst.setString(3, email);
			prst.setInt(4, areacode);
			prst.setLong(5, number);
			prst.setString(6, address);
			prst.setString(7, address2);
			prst.setString(8, city);
			prst.setString(9, state);
			prst.setInt(10, zipcode);
			prst.setString(11, date);
			prst.setString(12, time);
			prst.setString(13, details);
			prst.setInt(14, serve);
			int row = prst.executeUpdate();
			
			if(row>0) {
			request.getRequestDispatcher("thankyou.html").include(request, response);		}
			out.close();
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
	
		
		
	}

}
