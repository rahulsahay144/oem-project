package com;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.util.DBConnection;

@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
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
		String i = req.getParameter("aid");
		String a = req.getParameter("field");
		String sa = req.getParameter("subfield");
		String t = req.getParameter("tech");
		String st = req.getParameter("file");

		Connection con = null;
		try {
			con = DBConnection.getDBConnection();
			
//			boolean isMultipart = ServletFileUpload.isMultipartContent(req);
			InputStream inputStream = null; // input stream of the upload file
			
//			if (isMultipart) {
//				FileItemFactory factory = new DiskFileItemFactory();
//				ServletFileUpload upload = new ServletFileUpload(factory);
//				
//				List<?> items = null;
//				try {
//					items = upload.parseRequest(req);
//				} 
//				catch (FileUploadException e) {
//					e.printStackTrace();
//				}
//				
//				Iterator<?> itr = items.iterator(); 
//				
//				while (itr.hasNext()) {
//					FileItem item = (FileItem) itr.next();
//					if (item.isFormField()) {
//						String name = item.getFieldName();
//						String value = item.getString();
//
//						if (name.equals("aname")) {
//							n = value;
//						} else if (name.equals("aid")) {
//							i = value;
//						} else if (name.equals("field")) {
//							a = value;
//						} else if (name.equals("subfield")) {
//							sa = value;
//						} else if (name.equals("tech")) {
//							t = value;
//						} else if (name.equals("subtech")) {
//							st = value;
//						}
//						else if (name.equals("file")) {
//							st = value;
//						}
//					}
//					else {
//						inputStream = item.getInputStream(); 
//					}
//				}
//			}
	        
			
//			// obtains the upload file part in this multipart request
	        Part filePart = req.getPart("file"); 
	        req.getParameter("file");
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }

			pst = con.prepareStatement("insert into topics values(?,?,?,?,?,?,?)");

			pst.setString(1, n);
			pst.setString(2, i);
			pst.setString(3, a);
			pst.setString(4, sa);
			pst.setString(5, t);
			pst.setString(6, st);
			pst.setBlob(7, inputStream);

			pst.executeUpdate();
			pst.close();

		} 
		catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("Error", "An Error has Occured. Please try again later!");
			RequestDispatcher rd = req.getRequestDispatcher("article.jsp");
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

		out.println("Article loaded Successfully !");
		RequestDispatcher rd = req.getRequestDispatcher("article.jsp");
		rd.include(req, res);

	}

}
