<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.util.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="base.html"/>
<body>
	 <% if(request.getAttribute("Error") != null) { %>
	 	<h4 style="color:red"><%=request.getAttribute("Error") %></h4>
	 <% } %>
	 <div style="float:right"><span>Welcome Service Engineer</span></div>
	<div class="loginblock">
		<h3>Assigned Complaints </h3>
		<table width="59%" border="1">
		    <thead>
		     <tr>
		        <td><b>Compliant Id</b></td>
		        <td><b>Customer Id</b></td>
		        <td><b>Product Id</b></td>
		        <td><b>Description</b></td>
		        <td><b>Date/Time</b></td>
		        <td><b>Status</b></td>
		    </tr>
		    </thead>
		    <tbody>
			   <%
					Connection con = DBConnection.getDBConnection();
					PreparedStatement pst = con.prepareStatement("select cid, uid, productId, des, datetime, status from complaints where TRIM(seuserid) = '" + session.getAttribute("uname") + "'");
					ResultSet rt = pst.executeQuery();
					
					while(rt.next()) {
						 out.print(String.format("<tr>" +
	                             "<td>%s</td>" +
	                             "<td>%s</td>" +
	                             "<td>%s</td>" +
	                             "<td>%s</td>" +
	                             "<td>%s</td>" +
	                             "<td>%s</td>" +
	                         "</tr>",
	                         rt.getString(1), rt.getString(2), rt.getString(3), rt.getString(4), rt.getString(5), rt.getString(6)));
					
					}
					
					rt.close();
					pst.close();
					con.close();
				%>
		    </tbody>
		</table>
	</div>
	<a href="se.html">&lt;Back</a>
</body>
</html>
