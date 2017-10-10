<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="a_JDBC.jsp.*"%>
<%
		String fname = request.getParameter("first_name");
		out.println(fname);
		String lname = request.getParameter("last_name");
		out.println(lname);
		String email = request.getParameter("email");
		out.println(email);
		String phone = request.getParameter("phone");
		out.println(phone);
		String add = request.getParameter("address");
		out.println(add);
		String uname = request.getParameter("uname");
		out.println(uname);
		String passwd = request.getParameter("passd");
		out.println(passwd);
		new Add_agent().addAgentInfo(fname, lname, email, phone, add, uname, passwd);
		//c.addCustInfo(1, "w", "e", "r", "t", "y", "ed", "01/01/0101", "u", "i", "o","1");
		//response.sendRedirect("aindex.jsp?policy="+policy+"&first_name="+fname+"&middle_name="+mname+"&last_name="+lname+"&email="+email+"&phone="+phone+"&address="+add+"&dob"+dob+"&uname="+uname+"&passd="+passwd+"&desig="+desig);
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#goHome").click(function() {
		$('#ad_main').load('admin_main.jsp');
	});
	$("#addCust").click(function() {
		$('#ad_main').load('addAgent.jsp');
	});
	
	
	var f = <%=fname%>;
	alert(f);
	
});

</script>
</head>
<body>
<div id="main">
<h1>Customer Added Successfully</h1>
<button id="addCust" class="btn btn-primary">Add another Agent</button>
<button id="goHome" class="btn btn-primary">Go to Dashboard</button>
</div>
</body>
</html>