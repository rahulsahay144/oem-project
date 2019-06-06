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
	 <div style="float:right"><span>Welcome Operator</span></div>
	<div class="loginblock">
		<h3>Product Details</h3>
		<table width="59%" border="1">
		    <thead>
		    <tr>
		        <td><b>User Id</b></td>
		        <td><b>Product Id</b></td>
		        <td><b>Product Name</b></td>
		        <td><b>Price</b></td>
		        <td><b>Date of Purchase</b></td>
		        <td><b>Warranty Date</b></td>
		    </tr>
		    </thead>
		    <tbody>
		    <%
				Connection con = DBConnection.getDBConnection();
				PreparedStatement pst = con.prepareStatement("select uname, prid, pname, pprice, dpurchase, warrentydt from product");
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
	<a href="operator.html">&lt;Back</a>
	</div>
</body>
</html>
