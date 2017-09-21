<%@ page import="JDBC.jsp.*"%>
<% 
	String username= (String)session.getAttribute("current_user");
	System.out.println(username);
    cust_profile c = new cust_profile();
	String tuple[] =c.cust_p(username);

%>
<div class="container">
	<link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap-theme.min.css">
	<link rel="stylesheet" href="bootstrapValidator.min.css">
	<form class="well form-horizontal" action="cust_p_changes.jsp" method="get"
		id="contact_form">

		<fieldset>

			<!-- Form Name -->
			<legend>Contact Us Today!</legend>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">First Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-address-card" aria-hidden="true"></i><i
							class="glyphicon glyphicon-user"></i></span> <input name="first_name"
							placeholder="First Name" class="form-control" type="text" value="<%out.println(tuple[0]);%>">
					</div>
				</div>
			</div>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Middle Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-address-card" aria-hidden="true"></i><i
							class="glyphicon glyphicon-user"></i></span> <input name="middle_name"
							placeholder="First Name" class="form-control" type="text" value="<%out.println(tuple[1]);%>">
					</div>
				</div>
			</div>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Last Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-address-card" aria-hidden="true"></i><i
							class="glyphicon glyphicon-user"></i></span> <input name="last_name"
							placeholder="Last Name" class="form-control" type="text" value="<%out.println(tuple[2]);%>">
					</div>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">E-Mail</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i>
						<i
							class="glyphicon glyphicon-envelope"></i></span> <input name="email"
							placeholder="E-Mail Address" class="form-control" type="text" value="<%out.println(tuple[6]);%>">
					</div>
				</div>
			</div>


			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Phone</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i>
						<i
							class="glyphicon glyphicon-earphone"></i></span> <input name="phone"
							placeholder="(845)555-1212" class="form-control" type="text" value="<%out.println(tuple[4]);%>">
					</div>
				</div>
			</div>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Address</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-address-book" aria-hidden="true"></i>
						<i
							class="glyphicon glyphicon-home"></i></span> <input name="address"
							placeholder="Address" class="form-control" type="text" value="<%out.println(tuple[3]);%>">
					</div>
				</div>
			</div>

			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Date Of Birth</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i>
						<i
							class="glyphicon glyphicon-home"></i></span> <input name="city"
							placeholder="city" class="form-control" type="text" value="<%out.println(tuple[5]);%>">
					</div>
				</div>
			</div>
      

  <button type="submit" value="Submit">Save Changes</button>

		</fieldset>
	</form>
</div>
</div>
<!-- /.container -->