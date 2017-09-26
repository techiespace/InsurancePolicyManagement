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

</head>

<body>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading -->
		<h1 style="color: #03275A;" class="my-4">Make Payments</h1>
		<hr>
		<%
			try {

				//String type = (String) session.getAttribute("type");
				Connection conn = new Connect().myDBConnect();

				int id = (Integer) session.getAttribute("Id");
				System.out.println("ID:" + id);
				
				int cust[] = new int[30];
				int cnt=0,cnt2=0;
				String fname;
				String mname;
				String lname;
				
				
				String sql1 = "select cust_id from customer_agent where agent_id=?";
				String sql2 = "select c_fname,c_mname,c_lname from customer where cust_id=?";
				PreparedStatement stmt1 = conn.prepareStatement(sql1);
				PreparedStatement stmt2 = conn.prepareStatement(sql2);
				stmt1.setInt(1, id);
				ResultSet rs1 = stmt1.executeQuery();
				
				while (rs1.next()) {
					cust[cnt++] = rs1.getInt(1);
				}
				
				
				for (int i = 0; i < cnt; i++) {
					
					int j=cust[i];
					stmt2.setInt(1, j);
					ResultSet rs2 = stmt2.executeQuery();
					rs2.next();
					fname = rs2.getString(1);
					rs2.next();
					mname= rs2.getString(2);
					rs2.next();
					lname= rs2.getString(3);
							
					
					

				
				
		%>



		<!-- Project One -->
		<div
			style="margin-left: 0.4em; background-color: white; color: #F2B809; padding: 0.3em; margin-right: 5em;">
			<div class="row">
				<div class="col-md-8">
					<h2
						style="padding: 0.5em; background-color: white; color: #03275A; margin-top: 0; margin-bottom: 0.2em;">

						<%
							out.println(fname);
						%>
					</h2>
				</div>
				<div class="col-md-4">
					<a class=" btn btn-primary checkout_done"
						style="color: white; margin-top: 1em;"
						id="<%out.print(mname);%>">Pay now</a>
				</div>
			</div>
			<div style="width: 90%; padding: 0.5em;">
				<div class="row" style="margin-left: 0.6em; color: #03275A">
					<p>
						<b>Policy Number: </b>

						<%
							out.println(lname);
						    out.println("<br> <hr>");
						%>
					</p>
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