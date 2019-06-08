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

import com.util.DBConnection;

/**
 * Servlet implementation class Product
 */
public class AssignComplaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignComplaint() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");

		PrintWriter out = res.getWriter();

		String s1 = req.getParameter("cid");
		String s2 = req.getParameter("seuname");

		RequestDispatcher rd = null;

		if (s1 == "" || s2 == "") {
			//out.println("All Text boxes are Mandatary");
			req.setAttribute("Error", "All Text boxes are Mandatory!");
			rd = req.getRequestDispatcher("assign-complaint.jsp");
			rd.include(req, res);
		} 
		else {
			Connection con = null;
			PreparedStatement pstm = null;
			try {
				con = DBConnection.getDBConnection();
				pstm = con.prepareStatement("update complaints set seuserid = ?, status = ? where cid = ?");

				System.out.println("query created...");
				pstm.setString(1, s2);
				pstm.setString(2, "Assigned");
				pstm.setString(3, s1);

				pstm.executeUpdate();
				System.out.print("query Fired");

				pstm.close();
				con.close();
			} 
			catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("Error", "An Error has Occured. Please try again later!");
				rd = req.getRequestDispatcher("assign-complaint.jsp");
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

			out.println("<script>alert('Complaint Successfully Assigned');</script>");
			rd = req.getRequestDispatcher("c-detail.jsp");
			rd.include(req, res);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
