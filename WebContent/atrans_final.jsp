<%@ page import="java.sql.*,JDBC.jsp.*,a_JDBC.jsp.*"%>
<%
int agent_id = (Integer) session.getAttribute("Id");
String pol=request.getParameter("pol_no");
int pol_no=Integer.parseInt(pol);
String tot=request.getParameter("total");
double total=Double.parseDouble(tot);
String com=request.getParameter("commision");
double commision=Double.parseDouble(com);
int cust_id = new Get_cust().get_id(agent_id, pol_no);
Date s_date = new Prem_date().due_date(cust_id, pol_no);
Date e_date = new Term().term_date(cust_id, pol_no);
new Invoice().enter(cust_id, agent_id, total, pol_no, commision,s_date,e_date);
%>
<html>
<head>
</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	$("#goHome").click(function() {
		$('#main').load('amain.jsp');
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
