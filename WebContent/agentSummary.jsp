<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="card mb-3">
		<div class="card-header">
			<i class="fa fa-table"></i> Policy Summary
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							
						</div>
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="dataTables_filter">
								<label>Search:<input type="search"
									class="form-control form-control-sm" placeholder=""
									aria-controls="dataTable"></label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered dataTable" width="100%"
								id="dataTable" cellspacing="0" role="grid"
								aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 152px;">Policy</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending"
											style="width: 240px;">Customer Count</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 114px;">Commission</th>
									</tr>
								</thead>
								<tbody>
								<%
									String pName = "";
									double pMaturity;
									int modeli = 1;
									try {
										String type = (String) session.getAttribute("type");
										Connection conn = new Connect().myDBConnect();
										int id = (Integer) session.getAttribute("Id");
										String policyIdsql = "SELECT DISTINCT pol_no FROM customer_agent_policy where agent_id = " + id;
										Statement s = conn.createStatement();
										ResultSet rsPolicylist = s.executeQuery(policyIdsql);
										while (rsPolicylist.next()) {
											String sql = "select p_name from policy where pol_no=?";
											String custCountsql = "SELECT DISTINCT COUNT(cust_id) FROM customer_agent_policy where pol_no = ?";
											String totalCommisql = "SELECT sum(commision) FROM payment WHERE agent_id ="+id+" AND pol_no=?;";
											PreparedStatement stmt = conn.prepareStatement(sql);
											stmt.setInt(1, rsPolicylist.getInt(1));
											PreparedStatement prepcustCount = conn.prepareStatement(custCountsql);
											prepcustCount.setInt(1, rsPolicylist.getInt(1));
											
											PreparedStatement preptotalCommi = conn.prepareStatement(totalCommisql);
											preptotalCommi.setInt(1, rsPolicylist.getInt(1));
											
											ResultSet rs = stmt.executeQuery();
											ResultSet rsCount = prepcustCount.executeQuery();
											ResultSet rsTotalCommi = preptotalCommi.executeQuery();
											while (rs.next() && rsCount.next() && rsTotalCommi.next()) {
												pName = rs.getString(1);
												int cusCount = rsCount.getInt(1);
												int totalCommi = rsTotalCommi.getInt(1);
												//double dDuration = Double.parseDouble(pDuration);
												//double dPremium = Double.parseDouble(pPremium);

												//pMaturity = 1.10 * dDuration * dPremium;
												//pMaturity = Math.round(pMaturity * 100) / 100;
									%>
								
									<tr role="row">
										<td class="sorting_1"><%out.println(pName);%></td>
										<td><%out.println(cusCount);%></td>
										<td><%out.println(totalCommi);%></td>
									</tr>
									<%
										}
											}
										conn.close();
										} catch (Exception e) {
											System.out.println(e);
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="card mb-3">
		<div class="card-header">
			<i class="fa fa-table"></i> Customer Summary
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							
						</div>
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="dataTables_filter">
								<label>Search:<input type="search"
									class="form-control form-control-sm" placeholder=""
									aria-controls="dataTable"></label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered dataTable" width="100%"
								id="dataTable" cellspacing="0" role="grid"
								aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 152px;">Customer</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending"
											style="width: 240px;">Total Investment</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 114px;">Total Commission</th>
									</tr>
								</thead>
								<tbody>
								<%
									String pName1 = "";
									double pMaturity1;
									int modeli1 = 1;
									try {
										String type = (String) session.getAttribute("type");
										Connection conn = new Connect().myDBConnect();
										int id = (Integer) session.getAttribute("Id");
										String custIdsql = "SELECT DISTINCT cust_id FROM customer_agent_policy where agent_id = " + id;
										Statement crCustId = conn.createStatement();
										ResultSet rsCustId = crCustId.executeQuery(custIdsql);
										
										while (rsCustId.next()) {
											String custNamesql = "select c_fname, c_lname from customer where cust_id="+rsCustId.getInt(1);
											String totalCommisql = "SELECT sum(commision) FROM payment WHERE agent_id ="+id+" AND cust_id="+rsCustId.getInt(1);
											String totalInvestsql = "SELECT sum(amt) FROM payment WHERE agent_id ="+id+" AND cust_id="+rsCustId.getInt(1);
											Statement crCustName = conn.createStatement();
											Statement crTotalCommi = conn.createStatement();
											Statement crTotalInvest = conn.createStatement();
											
											ResultSet rsCustName = crCustName.executeQuery(custNamesql);
											ResultSet rsTotalCommi = crTotalCommi.executeQuery(totalCommisql);
											ResultSet rsTotalInvest = crTotalInvest.executeQuery(totalInvestsql);
											while (rsCustName.next() && rsTotalCommi.next() && rsTotalInvest.next()) {
												String cfName = rsCustName.getString(1);
												String clName = rsCustName.getString(2);
												int totalCommi = rsTotalCommi.getInt(1);
												int totalInvest = rsTotalInvest.getInt(1);
												//double dDuration = Double.parseDouble(pDuration);
												//double dPremium = Double.parseDouble(pPremium);

												//pMaturity = 1.10 * dDuration * dPremium;
												//pMaturity = Math.round(pMaturity * 100) / 100;
									%>
								
									<tr role="row">
										<td class="sorting_1"><%out.println(cfName+" "+clName);%></td>
										<td><%out.println(totalCommi);%></td>
										<td><%out.println(totalInvest);%></td>
									</tr>
									<%
										}
											}
										} catch (Exception e) {
											System.out.println(e);
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>