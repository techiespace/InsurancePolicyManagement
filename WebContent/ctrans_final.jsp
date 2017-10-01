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
//response.sendRedirect("index.jsp");
%>
<html>
<head>
<style>

</style>
</head>
<body>
<div id="main">

<h1>Transaction Successful!</h1>
</div>
</body>
</html>
