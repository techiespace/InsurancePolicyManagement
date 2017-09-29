
<html>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<head>
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".checkout_done").click(function() {
	         var pol_no=$(this).attr('id');
			$('#main').load('checkout.jsp?pol_no='+pol_no);
		});

	});
</script>


</head>

<body>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading -->
		<h1  style="color:#03275A;"class="my-4">Premium Payments</h1>
		<hr>
		<%

		try {

				//String type = (String) session.getAttribute("type");
				Connection conn = new Connect().myDBConnect();

				int id = (Integer) session.getAttribute("Id");
				System.out.println("ID:" + id);
				int pols[] = new int[30];
				int pols_amt[] = new int[30];
				int day_diff[] = new int[30];
				String pol_names[] = new String[30];
				int cnt = 0, acnt = 0;
				//String agentid = "select agent_id from customer_agent where cust_id="+id;
				String sql1 = "select pol_no from customer_policy where cust_id=?";
				String sql2 = "select p_name,premium from policy where pol_no=?";
				PreparedStatement stmt1 = conn.prepareStatement(sql1);
				PreparedStatement stmt2 = conn.prepareStatement(sql2);
				stmt1.setInt(1, id);
				ResultSet rs1 = stmt1.executeQuery();
				while (rs1.next()) {
					pols[cnt++] = rs1.getInt(1);
				}
				acnt = 0;
				for (int i = 0; i < cnt; i++) {
					System.out.println("Pol no " + i + ":" + pols[i]);
				}
				for (int i = 0; i < cnt; i++) {
					day_diff[i] = new Premium().date(id, pols[i]);
				}
				for (acnt = 0; acnt < cnt; acnt++) {
					stmt2.setInt(1, pols[acnt]);
					ResultSet rs2 = stmt2.executeQuery();
					rs2.next();
					pol_names[acnt] = rs2.getString(1);
					pols_amt[acnt] = rs2.getInt(2);
		%>
		

		
		<!-- Project One -->
		<div style="margin-left: 0.4em; background-color:white; color:#F2B809; padding:0.3em; margin-right:5em; ">
			<div class="row" >
				<div class="col-md-8">
					<h2 style="padding:0.5em;  background-color:white; color:#03275A; margin-top:0; margin-bottom:0.2em;">
					
						<%
							out.println(pol_names[acnt]);
						%>
					</h2>
				</div>
				<div class="col-md-4">
					<a class=" btn btn-primary checkout_done" style="color:white; margin-top:1em;" id="<%out.print(pols[acnt]);%>">Pay now</a>
				</div>
			</div>
			<div style= "width:90%;padding:0.5em;">
			<div class="row" style="margin-left: 0.6em; color:#03275A ">
				<p>
					<b>Policy Number: </b>
					
					<%
						out.println(pols[acnt]);
					%>
				</p>
			</div>
			<div class="row" style="margin-left: 0.6em; color:#03275A">
				 <p>
					<b> Premium Amount: </b>
					<%
						out.println(pols_amt[acnt]);
					%>
					<p>
					
				
			</div>
			<div class="row" style="margin-left: 0.6em; color:#03275A">
				<h4>
					<%
						if (day_diff[acnt] < 0) {
									out.println("You have missed your premium due date for Policy Number:" + pols[acnt] + ".<br>");
									out.println("\nPlease pay it ASAP!");
								} else if (day_diff[acnt] == 0) {
									out.println("Your premium due date for Policy Number:" + pols[acnt] + " is today.");
									out.println("\nPlease pay it ASAP!");
								} else if (day_diff[acnt] > 0) {
									if (day_diff[acnt] >= 30) {
										out.println(
												"You have paid your premium for Policy Number:" + pols[acnt] + " for this month. <br>");
										out.println("\nNext premium is due in " + day_diff[acnt] + " days on "
												+ new Prem_date().due_date(id, pols[acnt]) + ".");
									} else {
										out.println("Next premium for Policy Number:" + pols[acnt] + " is due in " + day_diff[acnt]
												+ " days on " + new Prem_date().due_date(id, pols[acnt]) + ".");
									}

								}
								out.println("<hr>");
					%>
				</h4>
			</div>
			</div>
		</div>
		

		<%
			}
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
	</div>
	<!-- /.container -->
</body>


</html>