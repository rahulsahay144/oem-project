package com;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Article extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		HttpSession ses = req.getSession();

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		PreparedStatement pst = null;
		ResultSet rt = null;
		String n = req.getParameter("aname");
		String a = req.getParameter("field");
		String sa = req.getParameter("subfield");
		String t = req.getParameter("tech");
		String st = req.getParameter("subtech");

		try {

			Connection con = (Connection) ses.getAttribute("con");

			FileInputStream fin = new FileInputStream(req.getParameter("file"));

			int s = fin.available();

			byte b[] = new byte[s];
			fin.read(b);
			pst = con.prepareStatement(" insert into topics  values(?,?,?,?,?,?) ");

			pst.setString(1, n);
			pst.setString(2, a);
			pst.setString(3, sa);
			pst.setString(4, t);
			pst.setString(5, st);
			pst.setBytes(6, b);

			pst.executeUpdate();
			pst.close();

		} catch (Exception e) {
			out.println("asddas" + e.toString());
		}

		out.println("asddas");

	}

}
