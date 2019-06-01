package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Regis extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html");

		PrintWriter out = res.getWriter();

		String s1 = req.getParameter("firstname");
		String s2 = req.getParameter("lastname");
		String s3 = req.getParameter("id");
		String s4 = req.getParameter("password");
		String s5 = req.getParameter("date_birth");
		String s6 = req.getParameter("address");
		String s7 = req.getParameter("contactno");
		String s8 = req.getParameter("Ageofuser");
		String s9 = req.getParameter("role");

		RequestDispatcher rd = null;

		if (s1 == "" || s2 == "" || s3 == "" || s4 == "" || s5 == "" || s6 == "" || s7 == "" || s8 == "" || s9 == "") {
			rd = req.getRequestDispatcher("regis.html");
			rd.include(req, res);
			out.println("All Text boxes are Mandatary");
		} 
		else {
			Connection con = null;
			PreparedStatement pstm = null;
			ResultSet rt = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");

			} catch (Exception e) {
				System.out.println("class not found");
			}

			try {

				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crms", "root", "root");

			} catch (SQLException e) {
				System.out.println("Error InyourURL");
			}

			System.out.println("class loaded.........");
			try {
				pstm = con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?)");

				System.out.println("query created...");
				pstm.setString(1, s1);
				pstm.setString(2, s2);
				pstm.setString(3, s3);
				pstm.setString(4, s4);

				pstm.setString(5, s5);
				pstm.setString(6, s6);
				pstm.setString(7, s7);
				pstm.setString(8, s8);
				pstm.setString(9, s9);

				pstm.executeUpdate();
				System.out.print("query Fired");
				/*
				 * if(rt.next()==true){
				 * 
				 * rd=req.getRequestDispatcher("user.html"); rd.forward(req,res); } else{
				 * rd=req.getRequestDispatcher("index.html");
				 * out.print(" UserName Or Password Invalid"); rd.include(req,res);
				 * 
				 * }
				 */
				pstm = con.prepareStatement("insert into login values(?,?,?)");
				pstm.setString(1, s3);
				pstm.setString(2, s4);
				pstm.setString(3, s9);

				pstm.executeUpdate();

				pstm.close();
				con.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

			out.println("User Successfully Registered");
			rd = req.getRequestDispatcher("index.html");
			rd.include(req, res);

		}
	}

}
