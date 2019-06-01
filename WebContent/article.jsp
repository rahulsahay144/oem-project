<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'article.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>

<body>
	<h1 align="center" class="style1">Article Addotion Form</h1>
	<p>&nbsp;</p>
	<form id="form1" name="form1" method="post" action="article">
		<p>
			<label>Article Name: <input type="text" name="aname" />
			</label>
		</p>




		<%
HttpSession ses=request.getSession();

//Connection con =(Connection)ses.getAttribute("con");
ArrayList arr=new ArrayList();
//PreparedStatement pst=con.prepareStatement("select fieldid from field");
//ResultSet rt = pst.executeQuery();
int c=0;

/* while(rt.next())
{
arr.add(c,rt.getString(1));
c++;

}

rt.close();
pst.close();  */


arr.add(0,"a");
arr.add(1,"b");
arr.add(2,"c");
arr.add(3,"d");


%>

		<p>
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
		</p>






		<%



arr=new ArrayList();
//pst=con.prepareStatement("select subfieldid from subfield");
//rt = pst.executeQuery();
c=0;

/* while(rt.next())
{
arr.add(c,rt.getString(1));
c++;

}

rt.close();
pst.close(); */



arr.add(0,"a");
arr.add(1,"b");
arr.add(2,"c");
arr.add(3,"d");

%>

		<p>
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
		</p>
		<%

arr=new ArrayList();
/* pst=con.prepareStatement("select techid from tech ");
 rt = pst.executeQuery();*/
c=0;

/* while(rt.next())
{
arr.add(c,rt.getString(1));
c++;

}

rt.close();
pst.close(); */


arr.add(0,"a");
arr.add(1,"b");
arr.add(2,"c");
arr.add(3,"d");



%>

		<p>
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
		</p>




		<%



arr=new ArrayList();
/* pst=con.prepareStatement("select subtechid from subtech ");
rt = pst.executeQuery(); */
c=0;

/* while(rt.next())
{
arr.add(c,rt.getString(1));
c++;

}

rt.close();
pst.close(); */


arr.add(0,"a");
arr.add(1,"b");
arr.add(2,"c");
arr.add(3,"d");



%>

		<p>
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
		</p>


		Select Article <input type="file" name="file" /> <br> <br>

		<INPUT type="submit" value="Upload">&nbsp; <INPUT type="reset"
			value="Cancel">


		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
	</form>
	<p>&nbsp;</p>
</body>
</html>
