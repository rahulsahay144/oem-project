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
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String n = req.getParameter("user");
		String p = req.getParameter("pass");
		String r = req.getParameter("role");
		
		System.out.println("user......" + n);
		System.out.println("pass......" + p);
		System.out.println("role......" + r);

		RequestDispatcher rd = null;
		if (n == "" || p == "") {
			out.println("Password Or User Name can't be empty");
			rd = req.getRequestDispatcher("index.html");
			rd.include(req, res);

		} else {
			Connection con = null;
			PreparedStatement pstm = null;
			ResultSet rt = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");

			} catch (Exception e) {
				System.out.println("class not found");
			}

			try {
				con = DriverManager.getConnection("jdbc:mysql://test.cgwmmjmwc33x.us-east-1.rds.amazonaws.com:3306/oem", "admin", "admin1234");
			} catch (SQLException e) {
				out.println("Error Inyour URL");
				e.printStackTrace();
			}

			try {
				pstm = con.prepareStatement("select * from login where uname=? and password=? and role=?");

				pstm.setString(1, n);
				pstm.setString(2, p);
				pstm.setString(3, r);

				rt = pstm.executeQuery();
				System.out.println("query Fired......");
				if (rt.next() == true) {
					HttpSession ses = req.getSession(true);
					ses.setAttribute("con", con);
					if (r.equals("0")) {

						rd = req.getRequestDispatcher("admin.html");
						rd.forward(req, res);
					} else {

						rd = req.getRequestDispatcher("user.html");
						rd.forward(req, res);

					}

				} else {
					out.print(" UserName Or Password Invalid");
					rd = req.getRequestDispatcher("index.html");

					rd.include(req, res);

				}

				rt.close();
				pstm.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
