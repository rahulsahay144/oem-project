<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.util.DBConnection"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="base.html" />

<body>
<div class="content">
	<div style="float: right">
		<span>Welcome Administrator</span>
	</div>
	<% if(request.getAttribute("Error") != null) { %>
	<h4 style="color: red"><%=request.getAttribute("Error") %></h4>
	<% } %>
	<h3>Article Addition Form</h3>
	<form id="form1" name="form1" method="post" action="article">
		<label>Article Name: <input type="text" name="aname" />
		<label>Article Id: <input type="text" name="aid" />
		</label>
		<%
HttpSession ses=request.getSession();

Connection con =DBConnection.getDBConnection();
ArrayList arr=new ArrayList();
PreparedStatement pst=con.prepareStatement("select AreaId from field");
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

		<label>Field ID: <select name="field">
				<% int i=0;
	while(i<c){
	  %>
				<OPTION value=" <%= arr.get(i) %> "><%= arr.get(i) %></OPTION>

				<%
    i++;
    }
    %>
		</select>
		</label>

		<%



arr=new ArrayList();
pst=con.prepareStatement("select SubAreaId from subfield");
rt = pst.executeQuery();
c=0;

 while(rt.next())
{
arr.add(c,rt.getString(1));
c++;

}

rt.close();
pst.close();

%>

			<label>Sub-Field ID: <select name="subfield">
					<%  i=0;
	while(i<c){
	  %>
					<OPTION value=" <%= arr.get(i) %> "><%= arr.get(i) %></OPTION>

					<%
    i++;
    }
    %>
			</select>
			</label>
		<%

arr=new ArrayList();
pst=con.prepareStatement("select techid from tech");
 rt = pst.executeQuery();
c=0;

while(rt.next())
{
arr.add(c,rt.getString(1));
c++;

}

rt.close();
pst.close();

%>

			<label>Technology ID: <select name="tech">
					<%  i=0;
	while(i<c){
	  %>
					<OPTION value=" <%= arr.get(i) %> "><%= arr.get(i) %></OPTION>

					<%
    i++;
    }
    %>
			</select>
			</label>
		<%



arr=new ArrayList();
pst=con.prepareStatement("select subtechid from subtech ");
rt = pst.executeQuery();
c=0;

while(rt.next())
{
arr.add(c,rt.getString(1));
c++;

}

rt.close();
pst.close();

%>

			<label>Sub-Technology ID: <select name="subtech">
					<%  i=0;
	while(i<c){
	  %>
					<OPTION value=" <%= arr.get(i) %> "><%= arr.get(i) %></OPTION>

					<%
    i++;
    }
    %>
			</select>
			</label>

		Select Article <input type="file" name="file" /> <br> <br>

		<INPUT type="submit" value="Upload">&nbsp; <INPUT type="reset"
			value="Cancel">
	</form>
	<a href="admin.html">&lt;&nbsp;Back</a>
	</div>
</body>
</html>
