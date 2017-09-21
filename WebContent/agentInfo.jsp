<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<html>
<head>
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading -->
		<h1 class="my-4">Agent Information</h1>
		<%
			String afName = "";
			String alName = "";
			String aAddress = "";
			String aContact = "";
			String aEmail = "";
			try {
				String type = (String) session.getAttribute("type");
				Connection conn = new Connect().myDBConnect();
				int id = (Integer) session.getAttribute("Id");
				String agentid = "select agent_id from customer_agent where cust_id=" + id;
				Statement s = conn.createStatement();
				ResultSet agentlist = s.executeQuery(agentid);
				while (agentlist.next()) {
					String sql = "select a_fname, a_lname, a_phone, a_email, a_addr from agent where agent_id=?";
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, agentlist.getInt(1));
					ResultSet rs = stmt.executeQuery();
					while (rs.next()) {
						afName = rs.getString(1);
						alName = rs.getString(2);
						aAddress = rs.getString(5);
						aContact = rs.getString(3);
						aEmail = rs.getString(4);
		%>
		<hr>

		<!-- Project One -->
		<div class="row">
			<div class="col-md-4">
				<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
					src="http://placehold.it/700x300" alt="">
				</a>
			</div>
			<div class="col-md-8">
				<h3>
					<%
						out.println(afName);
					%>
					<%
						out.println(alName);
					%>
				</h3>
				<p>
					<b>Address: </b>
					<%
						out.println(aAddress);
					%><br> <b>Contact Number: </b>
					<%
						out.println(aContact);
					%><br> <b>Email: </b>
					<%
						out.println(aEmail);
					%>
				</p>
				<a class="btn btn-primary" href="mailto:<%out.println(aEmail);%>">Send
					mail</a>
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
	</div>
	<!-- /.container -->
</body>


</html>