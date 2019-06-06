package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

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
		String s3 = req.getParameter("username");
		String s4 = req.getParameter("password");
		String s5 = req.getParameter("date_birth");
		String s6 = req.getParameter("address");
		String s7 = req.getParameter("contactno");
		String s9 = req.getParameter("role");
		String s10 = req.getParameter("gender");

		RequestDispatcher rd = null;

		if (s1 == "" || s2 == "" || s3 == "" || s4 == "" || s5 == "" || s6 == "" || s7 == "" || s9 == "") {
			//out.println("All Text boxes are Mandatary");
			req.setAttribute("Error", "All Text boxes are Mandatory!");
			rd = req.getRequestDispatcher("regis.jsp");
			rd.include(req, res);
		} 
		else {
			Connection con = null;
			PreparedStatement pstm = null;
			try {
				con = DBConnection.getDBConnection();
				
				// Check Existing User
				pstm = con.prepareStatement("select * from login where uname=? and role=?");

				pstm.setString(1, s3);
				pstm.setString(2, s9);

				ResultSet rt = pstm.executeQuery();
				System.out.println("Cheking Exiting Username....");
				if (rt.next() == true) {
					System.out.println("User already exists...");
					req.setAttribute("Error", "Username is already in use. Please choose different username");
					rd = req.getRequestDispatcher("regis.jsp");
					rd.include(req, res);
					return;
				}
				
				pstm = con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?)");

				System.out.println("query created...");
				pstm.setString(1, s1);
				pstm.setString(2, s2);
				pstm.setString(3, s3);
				pstm.setString(4, s4);

				pstm.setString(5, s5);
				pstm.setString(6, s6);
				pstm.setString(7, s7);
				pstm.setString(8, s10);

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
			} 
			catch (SQLException e) {
				e.printStackTrace();
				
				req.setAttribute("Error", "An Error has occured!");
				rd = req.getRequestDispatcher("regis.jsp");
				rd.include(req, res);
				return;
			}
			finally {
				if(con != null) {
					try {
						con.close();
					}
					catch(SQLException e) {}
				}
			}

			out.println("User Successfully Registered");
			rd = req.getRequestDispatcher("regis.jsp");
			rd.include(req, res);

		}
	}

}
