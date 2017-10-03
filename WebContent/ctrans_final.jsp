<%@ page import="java.sql.*,JDBC.jsp.*"%>
<%
int cust_id = (Integer) session.getAttribute("Id");
String pol=request.getParameter("pol_no");
int pol_no=Integer.parseInt(pol);
String tot=request.getParameter("total");
double total=Double.parseDouble(tot);
String com=request.getParameter("commision");
double commision=Double.parseDouble(com);
int agent_id = new Get_Agent().agent_no(cust_id, pol_no);
new Invoice().enter(cust_id, agent_id, total, pol_no, commision);
%>
<html>
<head>
</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	$("#goHome").click(function() {
		$('#main').load('main.jsp');
	});
});

</script>

<div id="main">

<h1>
	<center>Transaction Successful!</center>
</h1>
<button id="goHome" class="btn btn-primary">Home</button>
</div>
</body>
</html>
