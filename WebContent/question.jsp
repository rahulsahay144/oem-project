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

<title>My JSP 'question.jsp' starting page</title>

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


	<%
  
session = request.getSession();
Connection con = (Connection)session.getAttribute("con");
Integer I=(Integer)session.getAttribute("i");
System.out.println("asfsdfsfdsfdddddddddddddd"+ I.toString());
PreparedStatement pst = con.prepareStatement("select * from temp",ResultSet.CONCUR_UPDATABLE);
System.out.println("asfsdfsfdsfdddddddddddddd"+ I.toString());
ResultSet rt = (ResultSet)session.getAttribute("rt");

System.out.println("asfsdfsfdsfdddddddddddddd"+ I.toString());
if(rt==null)
{
rt = pst.executeQuery();
}

int i=I.intValue();

String ques=null,op1=null,op2=null,op3=null,op4=null;
System.out.println("asfsdfsfdsfdddddddddddddd"+ I.toString());
if(rt.next())
{
System.out.println("asfsdfsfdsfffffffffff"+ I.toString());
rt.refreshRow();
ques=	rt.getString(1);
op1=	rt.getString(2);
op2=	rt.getString(3);
op3=	rt.getString(4);
op4=	rt.getString(5);
System.out.println("asfsdfsfdsf"+ I.toString());
session.setAttribute("i",new Integer(i));
session.setAttribute("rt",rt);


}
else{
rt.close();

response.sendRedirect("exam.jsp");

}

  
  
  
  %>
	<form id="form" name="form1" method="post" action="question">
		<p>
			Question 1:
			<%= ques %><br>
			<% System.out.println("dfsdfsdfsdfsf"+op1); %>
			<label> <% if (rt.getString(7).equals("0")){  %> <input
				type="radio" name="ans" value="1" /> <%
      }else{ %> <input type="radio" name="ans" value="1"
				checked="checked" /> <% } %> <%= op1 %>
			</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
				<% if (rt.getString(7).equals("0")){  %> <input type="radio"
				name="ans" value="2" /> <%
      }else{ %> <input type="radio" name="ans" value="2"
				checked="checked" /> <% } %> <%= op2 %></label> <br /> <br /> <label>
				<% if (rt.getString(7).equals("0")){  %> <input type="radio"
				name="ans" value="3" /> <%
      }else{ %> <input type="radio" name="ans" value="3"
				checked="checked" /> <% } %> <% System.out.println("dfsdfsdfsdfsf"+op3); %>
				<%= op3 %></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<label> <% if (rt.getString(7).equals("0")){  %> <input
				type="radio" name="ans" value="4" /> <%
      }else{ %> <input type="radio" name="ans" value="4"
				checked="checked" /> <% } %> <% System.out.println("dfsdfsdfsdfsf"+op4); %>
				<%= op4 %></label> <br /> <br /> <br /> <label> <input
				type="submit" name="action" value="Next" /> <input type="submit"
				name="action" value="Previous" /> <input type="submit"
				name="action" value="Submit" />
			</label> <br /> <input type="submit" name="action" value="End Exam" />
		</p>
	</form>

</body>
</html>
