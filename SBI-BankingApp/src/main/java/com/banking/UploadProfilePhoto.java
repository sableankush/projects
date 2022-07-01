package com.banking;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadProfilePhoto
 */

@MultipartConfig
@WebServlet("/UploadProfilePhoto")
public class UploadProfilePhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadProfilePhoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String username = request.getParameter("username");
		System.out.println(username);
		System.out.println("In do post method of Add Image servlet.");
		Part file = request.getPart("profilephoto");
		
		System.out.println(file);
		String imageFileName = file.getSubmittedFileName();
		System.out.println("Selected Image File Name: "+imageFileName);
		
		String uploadPath = "C:/Users/Pranav/OneDrive/Desktop/SBI-BankingApp/src/main/webapp/images/"+imageFileName;
		System.out.println("Upload Path: "+uploadPath);
		
		try {
		FileOutputStream fos = new FileOutputStream(uploadPath);
		InputStream is = file.getInputStream();
		
		byte[] data = new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "Bank", "Sablenitin25@");
			
			PreparedStatement  ps = con.prepareStatement ("update customersecurity set profilephoto=? where username=?");
			ps.setString(1, imageFileName );
			ps.setString(2, username);
			int status = ps.executeUpdate();
			
			
			response.sendRedirect("home.jsp");
			//RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
			//rd.include(request, response);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		}
	

}
