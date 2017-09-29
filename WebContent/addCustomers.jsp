
<%@ page import="JDBC.jsp.*"%>
<%
	/* String username= (String)session.getAttribute("current_user");
	System.out.println(username);
	cust_profile c = new cust_profile();
	String tuple[] =c.cust_p(username); */
%>

<script type="text/javascript">
	$('#contact_form').submit(function(){
		<%if (request.getParameter("first_name") != null && request.getParameter("middle_name") != null
				&& request.getParameter("last_name") != null && request.getParameter("email") != null
				&& request.getParameter("phone") != null && request.getParameter("address") != null
				&& request.getParameter("dob") != null && request.getParameter("uname") != null
				&& request.getParameter("passd") != null && request.getParameter("desig") != null) {
			String fname = request.getParameter("first_name");
			String mname = request.getParameter("middle_name");
			String lname = request.getParameter("last_name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String add = request.getParameter("address");
			String dob = request.getParameter("dob");
			String uname = request.getParameter("uname");
			String passwd = request.getParameter("passd");
			String desig = request.getParameter("desig");

			Add_cust c = new Add_cust();
			c.addCustInfo(fname, mname, lname, email, phone, add, dob, uname, passwd, desig);
			//c.addCustInfo("q", "w", "e", "r", "t", "y", "1/2/1993", "u", "i", "o");
			response.sendRedirect("index.jsp");
			}%>
				
	});
</script>

<div class="container">
	<form class="well form-horizontal" action="addCustomers.jsp"
		method="get" id="contact_form">

		<fieldset>
			<!-- Form Name -->
			<h1>Add new Customer</h1>


			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Designation</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="fa fa-address-card" aria-hidden="true"></i><i
							class="glyphicon glyphicon-user"></i></span> <input name="desig"
							placeholder="Designation" class="form-control" type="text">
					</div>
				</div>
			</div>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">First Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="fa fa-address-card" aria-hidden="true"></i><i
							class="glyphicon glyphicon-user"></i></span> <input name="first_name"
							placeholder="First Name" class="form-control" type="text">
					</div>
				</div>
			</div>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Middle Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="fa fa-address-card" aria-hidden="true"></i><i
							class="glyphicon glyphicon-user"></i></span> <input name="middle_name"
							placeholder="First Name" class="form-control" type="text">
					</div>
				</div>
			</div>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Last Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="fa fa-address-card" aria-hidden="true"></i><i
							class="glyphicon glyphicon-user"></i></span> <input name="last_name"
							placeholder="Last Name" class="form-control" type="text">
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">E-Mail</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope-o"
							aria-hidden="true"></i> <i class="glyphicon glyphicon-envelope"></i></span>
						<input name="email" placeholder="E-Mail Address"
							class="form-control" type="text">
					</div>
				</div>
			</div>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Phone</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-phone"
							aria-hidden="true"></i> <i class="glyphicon glyphicon-earphone"></i></span>
						<input name="phone" placeholder="(845)555-1212"
							class="form-control" type="text">
					</div>
				</div>
			</div>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Address</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="fa fa-address-book" aria-hidden="true"></i> <i
							class="glyphicon glyphicon-home"></i></span> <input name="address"
							placeholder="Address" class="form-control" type="text">
					</div>
				</div>
			</div>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Date Of Birth</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-calendar"
							aria-hidden="true"></i> <i class="glyphicon glyphicon-home"></i></span>
						<input name="dob" placeholder="Date of Birth" class="form-control"
							type="text">
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">Username</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope-o"
							aria-hidden="true"></i> <i class="glyphicon glyphicon-envelope"></i></span>
						<input name="uname" placeholder="Username" class="form-control"
							type="text">
					</div>
				</div>
			</div>
			<!-- Text input-->

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">Password</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope-o"
							aria-hidden="true"></i> <i class="glyphicon glyphicon-envelope"></i></span>
						<input name="passd" placeholder="Password" class="form-control"
							type="text">
					</div>
				</div>
			</div>
			<!-- Text input-->


			<button class="btn btn-primary" type="submit" value="Submit">Add
				customer</button>

		</fieldset>
	</form>
</div>
<!-- /.container -->

