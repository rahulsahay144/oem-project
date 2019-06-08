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
	 <div style="float:right"><span>Welcome Operator | <a href="logout">Sign-out</a></span></div>
	<div class="loginblock">
		<h3>User Details</h3>
		<table width="59%" border="1">
		    <thead>
		    <tr class="table_header">
		        <th><b>User Name</b></th>
		        <th><b>Product Id</b></th>
		        <th><b>Role</b></th>
		        <th><b>Date of Birth</b></th>
		        <th><b>Contact No.</b></th>
		        <th><b>Address</b></th>
		    </tr>
		    </thead>
		    <tbody>
		   <%
				Connection con = DBConnection.getDBConnection();
				PreparedStatement pst = con.prepareStatement("select l.uname, p.prid, CASE WHEN l.role = '0' THEN 'Adminstrator' WHEN l.role = '1' THEN 'User' WHEN l.role = '2' THEN 'Operator' WHEN l.role = '3' THEN 'Service Engineer' ELSE 'N/A' END AS role, u.DOB, u.ContactNo, u.Address from login l join user u on TRIM(u.UserId) = TRIM(l.uname) left outer join product p on TRIM(p.uname) = TRIM(u.UserId) group by l.uname, p.prid, l.role, u.DOB, u.ContactNo, u.Address");
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
                         rt.getString(1), rt.getString(2) == null ? "" : rt.getString(2), rt.getString(3), rt.getString(4), rt.getString(5), rt.getString(6) == null ? "" : rt.getString(6)));
				
				}
				
				rt.close();
				pst.close();
				con.close();
			%>
		    </tbody>
		</table>
	</div>
	<a href="#" onclick="window.history.back();">&lt;Back</a>
	</div>
</body>
</html>
