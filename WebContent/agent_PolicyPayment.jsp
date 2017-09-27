<html>

<%@ page import="a_JDBC.jsp.*"%>

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
		<br><br>
		<h2 style="color: #03275A;" class="my-4">Choose Customer</h2>
		<hr>
		<%
			try {

				Connection conn = new Connect().myDBConnect();

				int id = (Integer) session.getAttribute("Id");
				System.out.println("ID:" + id);
				
				int cust[] = new int[30];
				int cnt=0,cnt2=0,cnt3=0;
				String fname="";
				String mname="";
				String lname="";
				String pol_no[]=new String[30];
				
				
				String sql1 = "select cust_id from customer_agent_policy where agent_id=?";
				String sql2 = "select c_fname,c_mname,c_lname from customer where cust_id=?";
				String sql3 = "select pol_no from customer_agent_policy where cust_id=? and agent_id=?";
				PreparedStatement stmt1 = conn.prepareStatement(sql1);
				PreparedStatement stmt2 = conn.prepareStatement(sql2);
				PreparedStatement stmt3 = conn.prepareStatement(sql3);
				stmt1.setInt(1, id);
				ResultSet rs1 = stmt1.executeQuery();
				
				
				while(rs1.next())
				{
					cust[cnt++]=rs1.getInt(1);	
				}
				
				
				for(int i=0;i<cnt;i++)
				{
					int j=cust[i];
					stmt2.setInt(1, j);
					ResultSet rs2 = stmt2.executeQuery();
					rs2.next();
					fname = rs2.getString("c_fname");
					mname = rs2.getString("c_mname");
					lname = rs2.getString("c_lname");
					stmt3.setInt(1, j);
					stmt3.setInt(2, id);
					ResultSet rs3 = stmt3.executeQuery();
					while(rs3.next())
					{
						pol_no[cnt3++]=rs3.getString(1);	
					}
					
		%>



		<!-- Project One -->
		<div>
			
					<h2
						style="padding: 0.5em; background-color: white; color: #03275A; margin-top: 0; margin-bottom: 0.2em;">

						<%
							out.print(fname + " "); out.print(mname + " "); out.print(lname);
							out.print("<br> <br> Policy number(s): ");
							for(int k=0;k<10;k++)
							{
								if(pol_no[k]!=null)
								out.print(pol_no[k]);
							}
						    out.print("<br> <hr>");
						%>
					</h2>
				</div>

		<%
			cnt3=0;
			}
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
	</div>
	<!-- /.container -->

</body>


</html>