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

public class DeleteArticle extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteArticle() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");

		PrintWriter out = res.getWriter();

		String id = req.getParameter("id");

		RequestDispatcher rd = null;

		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = DBConnection.getDBConnection();
			pstm = con.prepareStatement("delete from topics where Aid = ?");

			System.out.println("query created...");
			pstm.setString(1, id);

			pstm.execute();
			System.out.print("query Fired");

			pstm.close();
			con.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("Error", "An Error has Occured. Please try again later!");
			rd = req.getRequestDispatcher("article-detail.jsp");
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

		out.println("<script>alert('Successfully deleted Article');</script>");
		//rd = req.getRequestDispatcher("article-detail.jsp");
		res.sendRedirect("article-detail.jsp");  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}