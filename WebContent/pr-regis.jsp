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

Connection con =DBConnection.getDBConnection();
ArrayList arr=new ArrayList();
PreparedStatement pst=con.prepareStatement("select uname from login where role = '1'");
ResultSet rt = pst.executeQuery();
int c=0;

while(rt.next())
{
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
	 <div style="float:right"><span>Welcome Operator</span></div>
	<div class="loginblock">
		<h3>New Product Registration</h3>
		<form id="form1" name="form1" method="post" action="product" >
			<span>User Id: </span>
			<span>
				<select name="uname">
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
			<span>Product Id: </span>
			<span>
				<input name="prid" type="text" size="20" maxlength="30" />
			</span>
			<span>Product name: </span>
			<span>
				<input name="pname" type="text" size="20" maxlength="30" />
			</span>
			<span>Product Price: </span>
			<span>
				<input name="pprice" type="text" size="20" maxlength="30" />
			</span>
			<span>Date of Purchase (DD/MM/YYYY)</span> 
			<span> 
				<input name="dpurchase" type="text" maxlength="20" />
			</span>
			<span>Last Date of Warranty:</span> 
			<span> 
				<input name="warrentydt" type="text" maxlength="20" />
			</span>
			<div>
				<input name="Submit" type="submit" value="Submit" />
				<input type="reset" name="Submit2" value="Reset" />
			</div>
			<br /> 
			<a href="operator.html">&lt;Back</a>
		</form>
	</div>
	</div>
	
</body>
</html>
