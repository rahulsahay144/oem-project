<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="base.html"/>

<body>
 	<div style="float:right"><span>Welcome Administrator</span></div>
 	 <% if(request.getAttribute("Error") != null) { %>
	 	<h4 style="color:red"><%=request.getAttribute("Error") %></h4>
	 <% } %>
	<h3>New Area Addition</h3>
	<form id="form1" name="form1" method="post" action="area">
		<label>Area Name: <input name="name" type="text" id="name"
			maxlength="25" value="" />
		</label>
		<p>
			<label>Area ID: <input name="id" type="text" id="id"
				maxlength="25" value="" />
			</label>
		</p>
		<p>
			<label>Area Description: 
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
</body>
</html>
