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
PreparedStatement pst=con.prepareStatement("select cid from complaints");
ResultSet rt = pst.executeQuery();
int c=0;

while(rt.next()) {
arr.add(c,rt.getString(1));
c++;
}

rt.close();
pst.close();

ArrayList seArr=new ArrayList();
pst=con.prepareStatement("select uname from login where role ='3'");
rt = pst.executeQuery();
int d=0;

while(rt.next()) {
	seArr.add(d,rt.getString(1));
	d++;
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
	 <div style="float:right"><span>Welcome Operator | <a href="logout">Sign-out</a></span></div>
	<div class="loginblock">
		<h3>Assign Compliants</h3>
		<form id="form1" name="form1" method="post" action="assigncomp" >
			<span>Select Complaint ID to be Assigned: </span>
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
			<span>Select Service Engineer: </span>
			<span> 
				<select name="seuname">
				<% int j=0;
					while(j<d){
					  %>
						<OPTION value=" <%= seArr.get(j) %> "><%= seArr.get(j) %></OPTION>
					<%
				    j++;
				    }
				%>
				</select>
			</span>
			<div>
				<input name="Submit" type="submit" value="Assign" />
			</div>
			<br /> 
			<a href="operator.html">&lt;Back</a>
		</form>
	</div>
	</div>
	
</body>
</html>
