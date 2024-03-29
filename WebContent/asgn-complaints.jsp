<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.util.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="base.html"/>
<body>
<div class="content">
	 <% if(request.getAttribute("Error") != null) { %>
	 	<h4 style="color:red"><%=request.getAttribute("Error") %></h4>
	 <% } %>
	 <div style="float:right"><span>Welcome Service Engineer | <a href="logout">Sign-out</a></span></div>
	<div class="loginblock">
		<h3>Assigned Complaints </h3>
		<table width="59%" border="1">
		    <thead>
		     <tr class="table_header">
		        <th><b>Compliant Id</b></th>
		        <th><b>Customer Id</b></th>
		        <th><b>Product Id</b></th>
		        <th><b>Description</b></th>
		        <th><b>Date/Time</b></th>
		        <th><b>Status</b></th>
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
	</div>
</body>
</html>
