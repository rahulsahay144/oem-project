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
PreparedStatement pst=con.prepareStatement("select prid from product");
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
 	<div style="float:right"><span>Welcome User</span></div>
 	 <% if(request.getAttribute("Error") != null) { %>
	 	<h4 style="color:red"><%=request.getAttribute("Error") %></h4>
	 <% } %>
	<h3>Post Complaints</h3>
	<table width="100%" border="0" cellpadding="0">
      <tr>
       <td style="line-height:1.5em;width:40%">
		    <h4>Instructions:</h4>  
			<p>User here first input Complaint Id, Customer Id and Product Id respectively and also input description about their problems, then send their complaints.</p>
		</td>
      <td style="line-height:1.5em;width:60%">
	       <form id="form1" name="form1" method="post" action="complaint">
				<label>Customer ID: <input name="uname" type="text" id="uname" disabled maxlength="25" value="<%=session.getAttribute("uname") %>" />
				</label>
				<p>
					<label>Product ID: 
					<select name="prid">
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
					<label>Description: 
					<textarea name="desc" rows="6"> </textarea>
					</label>
				</p>
				<p>
					<input type="submit" name="Submit" value="Submit" />
				</p>
			</form>
		</td>
      </tr>
    </table>
	<a href="user.html">&lt;&nbsp;Back</a>
	</div>
</body>
</html>
