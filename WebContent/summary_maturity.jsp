<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.text.DecimalFormat" %>

<html>
<head>
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body style="color: #03275A !important;">

	<!-- Page Content -->



	<div class="container">
		<h1 style="margin:3%; margin-bottom:0; margin-left:0;">Summary</h1>

		<%
			String pName = "";
			String pDuration = "";
			String pLatefee = "";
			String pPremium = "";
			String pComission = "";
			double pMaturity;
			DecimalFormat decFor = new DecimalFormat(".00");

			try {
				String type = (String) session.getAttribute("type");
				Connection conn = new Connect().myDBConnect();
				int id = (Integer) session.getAttribute("Id");
				String policydetails = "select pol_no from customer_policy where cust_id=" + id;
				Statement s = conn.createStatement();
				ResultSet agentlist = s.executeQuery(policydetails);
				while (agentlist.next()) {
					String sql = "select p_name, duration, late_fee, premium, commision from policy where pol_no=?";
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, agentlist.getInt(1));
					ResultSet rs = stmt.executeQuery();
					while (rs.next()) {
						pName = rs.getString(1);
						pDuration = rs.getString(2);
						pLatefee = rs.getString(3);
						pPremium = rs.getString(4);
						pComission = rs.getString(5);
						double dDuration= Double.parseDouble(pDuration);
						double dPremium= Double.parseDouble(pPremium);

						pMaturity= 1.10 * dDuration * dPremium;
		%>


		<hr>

		<!-- Project One -->

		<div class="row">

			<div class="col-md-8">
				<h3>
					<%
						out.println(pName);
					%>
				</h3>
				<p>
					<b>Maturity Amount: </b>
					<%
						out.println("%1.2f" + pMaturity);
					%><br> <b>Late Fee: </b>
					<%
						out.println(pLatefee);
					%><br> <b>Premium Amount: </b>
					<%
						out.println(pPremium);
					%><br> <b>Agent Commission Amount: </b>
					<%
						out.println(pComission);
					%>
				</p>

			</div>
		</div>

		<!-- /.row -->
		<hr>
		<%
		}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
		<!-- /.container -->
	</div>
</body>


</html>