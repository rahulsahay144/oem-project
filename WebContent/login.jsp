<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="base.html"/>
<head>
<style> 
.loginblock {
  display: block;
  border: 1px solid;
  padding: 10px;
  box-shadow: 5px 10px #888888;
  width: 50%;
  margin-left: 25%;
}
</style>
</head>

<body>
<div class="content">
	 <% if(request.getAttribute("Error") != null) { %>
	 	<h4 style="color:red"><%=request.getAttribute("Error") %></h4>
	 <% } %>
	<div class="loginblock">
		<form id="form1" name="form1" method="post" action="login" >
			<span> Role: </span>
			<span> 
				<select name="role">
						<option value="0">Administrator</option>
						<option value="1">Registered User</option>
						<option value="2">Operator</option>
						<option value="3">Service Engineer</option>
				</select>
			</span>
			
			<br />
			<span>User name: </span>
			<span>
				<input name="user" type="text" size="20" maxlength="30" />
			</span>
				
			<span>Password</span> 
			<span> 
				<input name="pass" type="password" maxlength="20" />
			</span>
			<br/>
			<div>
				<input name="Submit" type="submit" value="Log In" />
				<input type="reset" name="Submit2" value="Cancel" />
			</div>
			<br /> 
			<a href="regis.jsp">New User? Sign Up</a>
		</form>
	</div>
	</div>
</body>
</html>
