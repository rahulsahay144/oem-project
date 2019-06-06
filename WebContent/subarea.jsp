<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.util.DBConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="base.html"/>

<%
HttpSession ses=request.getSession();

Connection con = DBConnection.getDBConnection();
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

<body>
<div class="content">
 	<div style="float:right"><span>Welcome Administrator</span></div>
 	 <% if(request.getAttribute("Error") != null) { %>
	 	<h4 style="color:red"><%=request.getAttribute("Error") %></h4>
	 <% } %>
	<h3>New Sub-Area Addition</h3>
	<form id="form1" name="form1" method="post" action="subarea">
		<label>Sub-Area Name: <input name="name" type="text" id="name"
			maxlength="25" value="" />
		</label>
		<p>
			<label>Sub-Area ID: <input name="id" type="text" id="id"
				maxlength="25" value="" />
			</label>
		</p>
		<p>
			<label>Area ID: 
			<select name="field">
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
		</p>
		<p>
			<label>Sub-Area Description: 
			<textarea name="desc" id="desc"
					value="">
			</textarea>
			</label>
		</p>
		<p>
			<input type="submit" name="Submit" value="Accept" />
			<input type="reset" name="Submit2" value="Cancel" />
		</p>
	</form>
	<a href="admin.html">&lt;&nbsp;Back</a>
	</div>
</body>
</html>
