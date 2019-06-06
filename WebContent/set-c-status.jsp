<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.util.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="base.html"/>
<%
Connection con = DBConnection.getDBConnection();
ArrayList arr=new ArrayList();
PreparedStatement pst=con.prepareStatement("select cid from complaints where TRIM(seuserid) = '" + session.getAttribute("uname") + "'");
ResultSet rt = pst.executeQuery();
int c=0;

while(rt.next()) {
arr.add(c,rt.getString(1));
c++;
}

rt.close();
pst.close();
con.close();
%>
<body>
<div class="content">
	 <% if(request.getAttribute("Error") != null) { %>
	 	<h4 style="color:red"><%=request.getAttribute("Error") %></h4>
	 <% } %>
	 <div style="float:right"><span>Welcome Service Engineer</span></div>
	<div class="loginblock">
		<h3>Set Complaint Status</h3>
		<form id="form1" name="form1" method="post" action="setcstatus" >
			<span>Select Complaint ID: </span>
			<span> 
				<select name="cid">
				<% int i=0;
					while(i<c){
					  %>
						<OPTION value=" <%= arr.get(i) %> "><%= arr.get(i) %></OPTION>
					<%
				    i++;
				    }
				%>
				</select>
			</span>
			<span>Set Status: </span>
			<span> 
				<select name="status">
						<option value="In Progress">In Progress</option>
						<option value="Rejected">Rejected</option>
						<option value="Resolved">Resolved</option>
						<option value="Query">Query</option>
				</select>
			</span>
			<div>
				<input name="Submit" type="submit" value="Submit" />
			</div>
			<br /> 
			<a href="se.html">&lt;Back</a>
		</form>
	</div>
	</div>
	
</body>
</html>
