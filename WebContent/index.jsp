
<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*,JDBC.jsp.*"%>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="dashboard/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="dashboard/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- Plugin CSS -->
<link href="dashboard/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="dashboard/css/sb-admin.css" rel="stylesheet">

</head>


<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="#">LIC Welcome, <%
			try {

				String type = (String) session.getAttribute("type");
				Connection conn = new Connect().myDBConnect();
				int id = (Integer) session.getAttribute("Id");
				if (type.equals("user")) {
					//out.println("Cust");
					String sql = "select c_fname,c_mname,c_lname from customer where cust_id=?";
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, id);
					ResultSet rs = stmt.executeQuery();
					rs.next();
					out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3) + " fucker");
				} else if (type.equals("agent")) {
					//out.println("Agent");
					String sql = "select a_fname,a_lname from agent where agent_id=?";
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, id);
					ResultSet rs = stmt.executeQuery();
					rs.next();
					out.println(rs.getString(1) + " " + rs.getString(2));
				}
				
		%> <!-- session.getAttribute("userid")-->
</a>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
          <li class="nav-item active" data-toggle="tooltip" data-placement="right" title="Dashboard">
            <a class="nav-link" href="#">
              <i class="fa fa-fw fa-dashboard"></i>
              <span class="nav-link-text">
                Dashboard</span>
            </a>
          </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
            <a class="nav-link" href="#">
              <i class="fa fa-fw fa-server"></i>
              <span class="nav-link-text">
                My Policies</span>
            </a>
          </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
            <a class="nav-link" href="#">
              <i class="fa fa-fw fa-money"></i>
              <span class="nav-link-text">
                Policy Payment</span>
            </a>
          </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
            <a class="nav-link" href="#">
              <i class="fa fa-fw fa-address-card-o"></i>
              <span class="nav-link-text">
                My Profile</span>
            </a>
          </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
            <a class="nav-link" href="#">
              <i class="fa fa-fw fa-user-o"></i>
              <span class="nav-link-text">
                Agent Info</span>
            </a>
          </li>
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
            <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
              <i class="fa fa-fw fa-print"></i>
              <span class="nav-link-text">
                Invoice</span>
            </a>
					<ul class="sidenav-second-level collapse" id="collapseExamplePages">
						<li><a href="dashboard/login.jsp">Login Page</a></li>
						<li><a href="dashboard/register.html">Registration Page</a></li>
						<li><a href="dashboard/forgot-password.html">Forgot Password Page</a></li>
						<li><a href="dashboard/blank.html">Blank Page</a></li>
					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Menu Levels"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseMulti" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-sitemap"></i> <span class="nav-link-text">
							Menu Levels</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseMulti">
						<li><a href="#">Second Level Item</a></li>
						<li><a href="#">Second Level Item</a></li>
						<li><a class="nav-link-collapse collapsed"
							data-toggle="collapse" href="#collapseMulti2">Third Level</a>
							<ul class="sidenav-third-level collapse" id="collapseMulti2">
								<li><a href="#">Third Level Item</a></li>
								<li><a href="#">Third Level Item</a></li>
							</ul></li>
					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Link"><a class="nav-link" href="#"> <i
						class="fa fa-fw fa-link"></i> <span class="nav-link-text">
							Link</span>
				</a></li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" href="#"
					id="messagesDropdown" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-envelope"></i> <span
						class="d-lg-none">Messages <span
							class="badge badge-pill badge-primary">12 New</span>
					</span> <span class="new-indicator text-primary d-none d-lg-block">
							<i class="fa fa-fw fa-circle"></i> <span class="number">12</span>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="messagesDropdown">
						<h6 class="dropdown-header">New Messages:</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>David
								Miller</strong> <span class="small float-right text-muted">11:21
								AM</span>
							<div class="dropdown-message small">Hey there! This new
								version of SB Admin is pretty awesome! These messages clip off
								when they reach the end of the box so they don't overflow over
								to the sides!</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>Jane Smith</strong>
							<span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">I was wondering if you
								could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>John Doe</strong> <span
							class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">I've sent the final
								files over to you for review. When you're able to sign off of
								them let me know and we can discuss distribution.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="#"> View all messages </a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" href="#"
					id="alertsDropdown" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-bell"></i> <span
						class="d-lg-none">Alerts <span
							class="badge badge-pill badge-warning">6 New</span>
					</span> <span class="new-indicator text-warning d-none d-lg-block">
							<i class="fa fa-fw fa-circle"></i> <span class="number">6</span>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="alertsDropdown">
						<h6 class="dropdown-header">New Alerts:</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-success">
								<strong> <i class="fa fa-long-arrow-up"></i> Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-danger">
								<strong> <i class="fa fa-long-arrow-down"></i> Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-success">
								<strong> <i class="fa fa-long-arrow-up"></i> Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="#"> View all alerts </a>
					</div></li>
				<li class="nav-item">
					<form class="form-inline my-2 my-lg-0 mr-lg-2">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button class="btn btn-primary" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
				</li>
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"></i>
						Logout
				</a></li>
			</ul>
		</div>
	</nav>

	<div class="content-wrapper">

		<div class="container-fluid">

			<!-- Breadcrumbs -->
			<!-- <ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">My Dashboard</li>
			</ol> -->

			<!-- Icon Cards -->
			<div class="row">
				<div class="col-xl-6 col-sm-6 mb-3">
					<div class="card text-white bg-primary o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-server"></i>
							</div>
							<div class="mr-5" style="font-size:1.5em">My Policies</div>
						</div>
						<a href="#" class="card-footer text-white clearfix small z-1">
							<span class="float-left" style="font-size:1.2em">View Details</span> <span
							class="float-right"> <i class="fa fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-6 col-sm-6 mb-3" style="display:block;">
					<div class="card text-white bg-warning o-hidden h-100" ;">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-money"></i>
							</div>
							<div class="mr-5" style="font-size:1.5em">Premium Payment</div>
						</div>
						<a href="#" class="card-footer text-white clearfix small z-1">
							<span class="float-left" style="font-size:1.2em">View Details</span> <span
							class="float-right"> <i class="fa fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-6 col-sm-6 mb-3">
					<div class="card text-white bg-success o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-address-card-o"></i>
							</div>
							<div class="mr-5" style="font-size:1.5em">My Profile</div>
						</div>
						<a href="#" class="card-footer text-white clearfix small z-1">
							<span class="float-left"style="font-size:1.2em">View Details</span> <span
							class="float-right"> <i class="fa fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-6 col-sm-6 mb-3">
					<div class="card text-white bg-danger o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-newspaper-o"></i>
							</div>
							<div class="mr-5" style="font-size:1.5em">New plans by LIC!</div>
						</div>
						<a href="#" class="card-footer text-white clearfix small z-1">
							<span class="float-left" style="font-size:1.2em">View Details</span> <span
							class="float-right"> <i class="fa fa-angle-right"></i>
						</span>
						</a>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<!-- Example Notifications Card -->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-bell-o"></i> Feed Example<%
							
							String sql = "select c_fname,c_mname,c_lname from customer where cust_id=?";
							PreparedStatement stmt = conn.prepareStatement(sql);
							stmt.setInt(1, id);
							ResultSet rs = stmt.executeQuery();
							rs.next();
							out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3));
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
						</div>
						<div class="list-group list-group-flush small">
							<a href="#" class="list-group-item list-group-item-action">
								<div class="media">
									<img class="d-flex mr-3 rounded-circle"
										src="http://placehold.it/45x45" alt="">
									<div class="media-body">
										<strong>David Miller</strong> posted a new article to <strong>David
											Miller Website</strong>.
										<div class="text-muted smaller">Today at 5:43 PM - 5m
											ago</div>
									</div>
								</div>
							</a> <a href="#" class="list-group-item list-group-item-action">
								<div class="media">
									<img class="d-flex mr-3 rounded-circle"
										src="http://placehold.it/45x45" alt="">
									<div class="media-body">
										<strong>Samantha King</strong> sent you a new message!
										<div class="text-muted smaller">Today at 4:37 PM - 1hr
											ago</div>
									</div>
								</div>
							</a> <a href="#" class="list-group-item list-group-item-action">
								<div class="media">
									<img class="d-flex mr-3 rounded-circle"
										src="http://placehold.it/45x45" alt="">
									<div class="media-body">
										<strong>Jeffery Wellings</strong> added a new photo to the
										album <strong>Beach</strong>.
										<div class="text-muted smaller">Today at 4:31 PM - 1hr
											ago</div>
									</div>
								</div>
							</a> <a href="#" class="list-group-item list-group-item-action">
								<div class="media">
									<img class="d-flex mr-3 rounded-circle"
										src="http://placehold.it/45x45" alt="">
									<div class="media-body">
										<i class="fa fa-code-fork"></i> <strong>Monica Dennis</strong>
										forked the <strong>startbootstrap-sb-admin</strong> repository
										on <strong>GitHub</strong>.
										<div class="text-muted smaller">Today at 3:54 PM - 2hrs
											ago</div>
									</div>
								</div>
							</a> <a href="#" class="list-group-item list-group-item-action">
								View all activity... </a>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
			</div>

			<!-- Example Tables Card -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-table"></i> Data Table Example
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" width="100%" id="dataTable"
							cellspacing="0">
							<thead>
								<tr>
									<th>Name</th>
									<th>Position</th>
									<th>Office</th>
									<th>Age</th>
									<th>Start date</th>
									<th>Salary</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Name</th>
									<th>Position</th>
									<th>Office</th>
									<th>Age</th>
									<th>Start date</th>
									<th>Salary</th>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td>Tiger Nixon</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td>61</td>
									<td>2011/04/25</td>
									<td>$320,800</td>
								</tr>
								<tr>
									<td>Garrett Winters</td>
									<td>Accountant</td>
									<td>Tokyo</td>
									<td>63</td>
									<td>2011/07/25</td>
									<td>$170,750</td>
								</tr>
								<tr>
									<td>Donna Snider</td>
									<td>Customer Support</td>
									<td>New York</td>
									<td>27</td>
									<td>2011/01/25</td>
									<td>$112,000</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</div>

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- /.content-wrapper -->

	<footer class="sticky-footer">
		<div class="container">
			<div class="text-center">
				<small>Copyright &copy; Your Website 2017</small>
			</div>
		</div>
	</footer>

	<!-- Scroll to Top Button -->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>

	<!-- Logout Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Logout</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure you want to logout?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="dashboard/vendor/jquery/jquery.min.js"></script>
	<script src="dashboard/vendor/popper/popper.min.js"></script>
	<script src="dashboard/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="dashboard/vendor/chart.js/Chart.min.js"></script>
	<script src="dashboard/vendor/datatables/jquery.dataTables.js"></script>
	<script src="dashboard/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for this template -->
	<script src="dashboard/js/sb-admin.min.js"></script>

</body>

</html>
