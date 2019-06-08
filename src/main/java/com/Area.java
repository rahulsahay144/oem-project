package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConnection;

public class Area extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		HttpSession ses = req.getSession();
		Connection con = DBConnection.getDBConnection();
		RequestDispatcher rd = null;
		String n = req.getParameter("name");
		String id = req.getParameter("id");
		String desc = req.getParameter("desc");
		PreparedStatement pst = null;

		if (n == "" || id == "" || desc == "") {
			//out.println("All text fields are Mandatory");
			req.setAttribute("Error", "All fields are Mandatory!");
			rd = req.getRequestDispatcher("area.jsp");
			rd.include(req, res);
		} 
		else {
			req.removeAttribute("Error");
			try {
				pst = con.prepareStatement("insert into field value(?,?,?)");
				pst.setString(1, n);
				pst.setString(2, id);
				pst.setString(3, desc);
				pst.executeUpdate();
				pst.close();

				rd = req.getRequestDispatcher("admin.html");
				rd.include(req, res);
				out.println("<script>alert('Area Succesfully Added.');</script>");

			} 
			catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("Error", "An Error has Occured. Please try again later!");
				rd = req.getRequestDispatcher("area.jsp");
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
