<%@ page import="java.sql.*,JDBC.jsp.*"%>

<html>
<head>



</head>
<body>
<%
String pol = request.getParameter("pol_no");
int pol_no = Integer.parseInt(pol);
String tot = request.getParameter("total");
Double total = Double.parseDouble(tot);
String comm = request.getParameter("commision");
int commision = Integer.parseInt(comm);
int cust_id = (Integer) session.getAttribute("Id");
%>

<h1>Transaction Successful</h1>
<%out.println("Transaction Successful."); %>

</body>


</html>