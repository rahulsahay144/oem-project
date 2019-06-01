<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
HttpSession ses=request.getSession();

Connection con=(Connection)ses.getAttribute("con");
ArrayList arr=new ArrayList();
PreparedStatement pst=con.prepareStatement("select subfieldid from subfield");
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
<head>

<title>My JSP 'tech.jsp' starting page</title>


</head>

<body>
	<h1 align="center" class="style1">
		<u>New Technology Addition</u>
	</h1>
	<p>&nbsp;</p>
	<form id="form1" name="form1" method="post" action="tech">
		<label> Technology Name: <input name="name" type="text"
			id="name" maxlength="25" value="" />
		</label>
		<p>
			<label>Technology ID: <input name="id" type="text" id="id"
				maxlength="25" value="" />
			</label> <br>
		<p>
			<label>SubField ID: <select name="subfield">
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

		<label>Technology Desc: <input name="desc" type="text"
			id="desc" maxlength="5000" value="" />
		</label> <br>
		</p>
		</br> <input type="submit" name="Submit" value="Accept" /> </label></label></label> <label>
			<input type="reset" name="Submit2" value="Cancel" />
		</label>
</body>
</html>
