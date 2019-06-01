package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Subarea extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		HttpSession ses = req.getSession();
		Connection con = (Connection) ses.getAttribute("con");
		RequestDispatcher rd = null;
		String n = req.getParameter("name");
		String id = req.getParameter("id");
		String a = req.getParameter("field");

		String desc = req.getParameter("desc");
		PreparedStatement pst = null;

		if (n == "" || id == "" || desc == "") {
			out.println("All text fields are Mandatory");
			rd = req.getRequestDispatcher("subfield.jsp");
			rd.include(req, res);
		} else {
			try {
				pst = con.prepareStatement("insert into subfield value(?,?,?,?)");
				pst.setString(1, n);
				pst.setString(2, id);
				pst.setString(3, a);
				pst.setString(4, desc);
				pst.executeUpdate();
				pst.close();

				rd = req.getRequestDispatcher("admin.html");
				rd.include(req, res);
				out.println(" Sub-Field Succesfully Added.");

			} catch (Exception e) {
			}

		}

	}
}
