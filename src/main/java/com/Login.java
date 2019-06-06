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
import javax.servlet.http.HttpSession;

import com.util.DBConnection;

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
			//out.println("Password Or User Name can't be empty");
			req.setAttribute("Error", "User Name and/or Password cannot be empty!");
			rd = req.getRequestDispatcher("login.jsp");
			rd.include(req, res);

		} 
		else {
			req.removeAttribute("Error");
			
			Connection con = null;
			PreparedStatement pstm = null;
			ResultSet rt = null;
			
			HttpSession session = req.getSession(true);
			session.setAttribute("uname", n.trim());
			session.setAttribute("role", r);

			try {
				con = DBConnection.getDBConnection();
				pstm = con.prepareStatement("select * from login where uname=? and password=? and role=?");

				pstm.setString(1, n);
				pstm.setString(2, p);
				pstm.setString(3, r);

				rt = pstm.executeQuery();
				System.out.println("query Fired......");
				if (rt.next() == true) {
					HttpSession ses = req.getSession(true);
					ses.setAttribute("con", con);
					
					ses.setAttribute("uname", n);
					ses.setAttribute("role", r);
					
					if (r.equals("0")) {
						rd = req.getRequestDispatcher("admin.html");
						rd.forward(req, res);
					} 
					else if (r.equals("1")) {
						rd = req.getRequestDispatcher("user.html");
						rd.forward(req, res);
			
					}
					else if (r.equals("2")) {
						rd = req.getRequestDispatcher("operator.html");
						rd.forward(req, res);
			
					}
					else if (r.equals("3")) {
						rd = req.getRequestDispatcher("se.html");
						rd.forward(req, res);
					}

				} else {
					req.setAttribute("Error", "Invalid Username or Password!");
					rd = req.getRequestDispatcher("login.jsp");
					rd.include(req, res);
					return;

				}

				rt.close();
				pstm.close();

			} catch (SQLException e) {
				e.printStackTrace();
				
				req.setAttribute("Error", "Invalid Username or Password!");
				rd = req.getRequestDispatcher("login.jsp");
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
		}

	}

}
