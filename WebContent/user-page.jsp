<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.util.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="base.html"/>

<body>
<!-- The Modal -->
<div id="articleModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p id="articleText"></p>
  </div>

</div>

<script>

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  // Get the modal
  var modal = document.getElementById("articleModal");
  
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

function openArticle(value) {
	// Get the modal
	var modal = document.getElementById("articleModal");
	modal.style.display = "block";
	
	var text = document.getElementById("articleText");
	text.innerHTML = document.getElementById(value).innerHTML;
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}
}

function searchFunction() {
	  // Declare variables 
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("searchInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("articleTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	}
</script>


<div class="content">
	 <% if(request.getAttribute("Error") != null) { %>
	 	<h4 style="color:red"><%=request.getAttribute("Error") %></h4>
	 <% } %>
	 <div style="float:right"><span>Welcome User | <a href="logout">Sign-out</a></span></div>
	<div>
		<h3>Articles</h3>
		<input type="text" id="searchInput" onkeyup="searchFunction()" placeholder="Search for articles.."/>
		<table width="59%" border="1" id="articleTable">
		    <thead>
		    <tr class="table_header">
		        <th><b>Article Id</b></th>
		        <th><b>Article Name</b></th>
		        <th><b>Technology</b></th>
		        <th><b>Sub-Technology</b></th>
		        <th><b>Detail</b></th>
		    </tr>
		    </thead>
		    <tbody>
			   <%
					Connection con = DBConnection.getDBConnection();
					PreparedStatement pst = con.prepareStatement("select Aid, Areaname, Tid, Stid, Articles from topics where Aid is not null");
					ResultSet rt = pst.executeQuery();
					
					int id = 0;
					while(rt.next()) {
						 out.print(String.format("<tr>" +
	                             "<td>%s</td>" +
	                             "<td>%s</td>" +
	                             "<td>%s</td>" +
	                             "<td>%s</td>" +
	                             "<td>%s</td>" +
	                         "</tr>",
	                         rt.getString(1), rt.getString(2), rt.getString(3), rt.getString(4), rt.getString(5) == null ? "" : "<a href='#' onClick='javascript:openArticle(\"article_" + id + "\")'>View</a>"));
						 
						 out.print(String.format("<div id='%s' style='display:none' >%s</div>", "article_" + id,  rt.getString(5) == null ? "" : rt.getString(5)));
						 id++;
					
					}
					
					rt.close();
					pst.close();
					con.close();
				%>
		    </tbody>
		</table>
	</div>
	<hr/>
	<div>
		<h3>My Products</h3>
		<table width="59%" border="1">
		    <thead>
		    <tr class="table_header">
		        <th><b>Product Id</b></th>
		        <th><b>Product Name</b></th>
		        <th><b>Price</b></th>
		        <th><b>Date of Purchase</b></th>
		        <th><b>Warranty Date</b></th>
		    </tr>
		    </thead>
		    <tbody>
		    <%
				con = DBConnection.getDBConnection();
				pst = con.prepareStatement("select prid, pname, pprice, dpurchase, warrentydt from product where TRIM(uname) = '" + session.getAttribute("uname") + "'");
				rt = pst.executeQuery();
				
				while(rt.next()) {
					 out.print(String.format("<tr>" +
                             "<td>%s</td>" +
                             "<td>%s</td>" +
                             "<td>%s</td>" +
                             "<td>%s</td>" +
                             "<td>%s</td>" +
                         "</tr>",
                         rt.getString(1), rt.getString(2), rt.getString(3), rt.getString(4), rt.getString(5)));
				
				}
				
				rt.close();
				pst.close();
				con.close();
			%>
		    </tbody>
		</table>
	</div>
	<hr/>
	<div>
		<h3>My Compliants</h3>
		<table width="59%" border="1">
		    <thead>
		    <tr class="table_header">
		        <th><b>Compliant Id</b></th>
		        <th><b>Product Id</b></th>
		        <th><b>Description</b></th>
		        <th><b>Date/Time</b></th>
		        <th><b>Status</b></th>
		        <th><b>Service Engineer</b></th>
		    </tr>
		    </thead>
		    <tbody>
		   <%
				con = DBConnection.getDBConnection();
				pst = con.prepareStatement("select cid, productId, des, datetime, status, seuserid from complaints where TRIM(uid) = '" + session.getAttribute("uname") + "'");
				rt = pst.executeQuery();
				
				while(rt.next()) {
					 out.print(String.format("<tr>" +
                             "<td>%s</td>" +
                             "<td>%s</td>" +
                             "<td>%s</td>" +
                             "<td>%s</td>" +
                             "<td>%s</td>" +
                             "<td>%s</td>" +
                         "</tr>",
                         rt.getString(1), rt.getString(2), rt.getString(3), rt.getString(4), rt.getString(5), rt.getString(6) == null ? "" : rt.getString(6)));
				
				}
				
				rt.close();
				pst.close();
				con.close();
			%>
		    </tbody>
		</table>
	</div>
	<a href="user.html">&lt;Back</a>
	</div>
</body>
</html>
