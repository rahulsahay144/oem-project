<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="base.html"/>
<body>
	 <% if(request.getAttribute("Error") != null) { %>
	 	<h4 style="color:red"><%=request.getAttribute("Error") %></h4>
	 <% } %>
	<div class="loginblock">
		<h3>New Registration</h3>
		<form id="form1" name="form1" method="post" action="regis" >
			<span>User name: </span>
			<span>
				<input name="username" type="text" size="20" maxlength="30" />
			</span>
			<span>Password: </span>
			<span>
				<input name="password" type="text" size="20" maxlength="30" />
			</span>
			<span>First name: </span>
			<span>
				<input name="firstname" type="text" size="20" maxlength="30" />
			</span>
			<span>Last name: </span>
			<span>
				<input name="lastname" type="text" size="20" maxlength="30" />
			</span>
			<span>Sex: </span>
			<span> 
				<select name="gender">
						<option value="Male">Male</option>
						<option value="Female">Female</option>
				</select>
			</span>
			<span>Role: </span>
			<span> 
				<select name="role">
						<option value="0">Administrator</option>
						<option value="1">Registered User</option>
						<option value="2">Operator</option>
						<option value="3">Service Engineer</option>
				</select>
			</span>
			<span>Date of Birth (DD/MM/YYYY)</span> 
			<span> 
				<input name="date_birth" type="text" maxlength="20" />
			</span>
			<span>Contact No.:</span> 
			<span> 
				<input name="contactno" type="text" maxlength="20" />
			</span>
			<span>Address:</span> 
			<span> 
				<textarea name="address" rows="6"> </textarea>
			</span>
			<div>
				<input name="Submit" type="submit" value="Submit" />
				<input type="reset" name="Submit2" value="Reset" />
			</div>
			<br /> 
			<a href="login.jsp">&lt;Back to Login</a>
		</form>
	</div>
	
</body>
</html>
