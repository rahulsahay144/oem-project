<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.util.DBConnection"%>

<%
HttpSession ses=request.getSession();

Connection con=DBConnection.getDBConnection();
ArrayList arr=new ArrayList();
PreparedStatement pst=con.prepareStatement("select SubAreaId from subfield");
ResultSet rt = pst.executeQuery();
int c=0;
while(rt.next())
{
arr.add(c,rt.getString(1));
c++;
}

rt.close();
pst.close();

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="base.html" />

<body>
<div class="content">
	<div style="float:right"><span>Welcome Administrator</span></div>
 	 <% if(request.getAttribute("Error") != null) { %>
	 	<h4 style="color:red"><%=request.getAttribute("Error") %></h4>
	 <% } %>
	<h3>New Technology Addition</h3>
	<form id="form1" name="form1" method="post" action="tech">
		<label> Technology Name: <input name="name" type="text"
			id="name" maxlength="25" value="" />
		</label>
		<p>
			<label>Technology ID: <input name="id" type="text" id="id"
				maxlength="25" value="" />
			</label>
		<p>
			<label>Sub-Area ID: <select name="subarea">
					<% int i=0;
	while(i<c){
	  %>
					<OPTION value=" <%= arr.get(i) %> "><%= arr.get(i) %></OPTION>

					<%
    i++;
    }  %>
			</select>
			</label>
		</p>

		<label>Technology Desc: <input name="desc" type="text"
			id="desc" maxlength="5000" value="" />
		</label> <br>
		</p>
		<p>
			<input type="submit" name="Submit" value="Accept" /> <input
				type="reset" name="Submit2" value="Cancel" />
		</p>
		<a href="admin.html">&lt;&nbsp;Back</a>
		</form>
</body>
</html>
