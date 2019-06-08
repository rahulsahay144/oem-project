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

public class Subtech extends HttpServlet {

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
		String techid = req.getParameter("Technology");
		String desc = req.getParameter("desc");
		PreparedStatement pst = null;

		if (n == "" || id == "" || desc == "") {
			out.println("All text fields are Mandatory");
			rd = req.getRequestDispatcher("Sub-tech.jsp");
			rd.include(req, res);
		} else {
			try {
				pst = con.prepareStatement("insert into subtech value(?,?,?,?)");
				pst.setString(1, n);
				pst.setString(2, id);
				pst.setString(3, techid);
				pst.setString(4, desc);
				pst.executeUpdate();
				pst.close();

				rd = req.getRequestDispatcher("admin.html");
				rd.include(req, res);
				out.println("<script>alert('Sub-Technologies are Succesfully Added.');</script>");

			} 
			catch (SQLException e) {
				e.printStackTrace();
				
				req.setAttribute("Error", "An Error has occured!");
				rd = req.getRequestDispatcher("Sub-tech.jsp");
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
