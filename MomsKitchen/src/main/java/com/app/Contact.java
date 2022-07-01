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

public class Contact extends HttpServlet {
	
	static Connection c = null;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery", "Bakery", "Sablenitin25@");
			
			PreparedStatement prst = c.prepareStatement("insert into contact values(?,?,?)");
			
			prst.setString(1, name);
			prst.setString(2, email);
			prst.setString(3, message);
			int row = prst.executeUpdate();
			
			if(row>0) {
			request.getRequestDispatcher("thanks.html").include(request, response);		}
			out.close();
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
	
		
		
	}

}
