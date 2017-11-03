
<%@ page import="JDBC.jsp.*,java.sql.*,JDBC.jsp.*"%>
<%@ page import="JDBC.jsp.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DatabaseMetaData"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%
	/* String username= (String)session.getAttribute("current_user");
	System.out.println(username);
	cust_profile c = new cust_profile();
	String tuple[] =c.cust_p(username); */
%>

<script type="text/javascript">
	$('#addpolbtn')
			.click(
					function() {
	
			var pname = $('#policy_name').val();
			var pno = $('#policy_number').val();
			var dur = $('#duration').val();
			var lfee = $('#late_fee').val();
			var prem = $('#premium').val();
			var comm = $('#commision').val();
		
			$('#ad_main').load("newPolAddSuccess.jsp?policy_name="+pname+"&policy_number="+pno+"&duration="+dur+"&late_fee="+lfee+"&premium="+prem+"&commision="+comm);
	});
</script>
<style>
.form-group{
	display:inline-flex;
}
.control-label{
	width:600px;
}
.container{
	padding-bottom:50px;
}
label{
	font-weight:bold;
}
.selectpicker{
	width:216px;
}

</style>


<div class="container">
	<div class="well form-horizontal">

		<fieldset>
			<!-- Form Name -->
			<h1 style="padding-bottom:50px;">Add New Policy</h1>

			
			
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Policy Name</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="policy_name"
							placeholder="Policy Name" class="form-control" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->
			
			<div class="form-group">
				<label class="col-md-4 control-label">Policy Number</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="policy_number"
							placeholder="Policy Number" class="form-control" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Duration (in months)</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="duration"
							placeholder="12" class="form-control" type="text">
					</div>
				</div>
			</div>
			
			
			<br>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label">Late fee</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="late_fee" placeholder="500"
							class="form-control" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Premium</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="premium" placeholder="5000"
							class="form-control" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			<div class="form-group">
				<label class="col-md-4 control-label">Percentage of commission</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<input id="commision"
							placeholder="5" class="form-control" type="text">
					</div>
				</div>
			</div>
			<br>
			<!-- Text input-->

			
			<br>
			<!-- Text input-->


			<button id="addpolbtn" style="margin:14px" class="btn btn-primary">Add
				policy</button>

		</fieldset>
	</div>
</div>
<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<!-- /.container -->

