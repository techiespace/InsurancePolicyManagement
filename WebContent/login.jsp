<%@ page import="JDBC.jsp.*"%>

<%
	String msg = "";
	boolean isPost = "POST".equals(request.getMethod());

	//if(request.getParameter("userC") != null && request.getParameter("signup") != null)
	if (isPost == true) {
		if (request.getParameter("userC") != null && request.getParameter("passC") != null) {
			int keyc = new Cust_login().ID(request.getParameter("userC"), request.getParameter("passC"));
			if (keyc == 122) {
				msg = "*Invalid Username or Password.";
			} else {
				session.setAttribute("type", "user");
				session.setAttribute("Id", keyc);
				response.sendRedirect("index.jsp");
			}
		}
		if (request.getParameter("userP") != null && request.getParameter("passP") != null) {
			int keyp = new Agent_login().ID(request.getParameter("userP"), request.getParameter("passP"));
			if (keyp == 122) {
				msg = "*Invalid Username or Password.";
			} else {
				session.setAttribute("type", "agent");
				session.setAttribute("Id", keyp);
				response.sendRedirect("index.jsp");
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day 001 Login Form</title>


<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Open+Sans:600'>

<link rel="stylesheet" href="CSS/style.css">


</head>

<body>
	<form action="login.jsp" method="post">
		<!--<img src="CSS/logo.jpeg"  style="position: absolute; left:15%;top:7%;width:25%">-->
		<img src="CSS/logo3.jpg"
			style="position: absolute; left: 10%; top: 13%; width: 35%; height: 75%;">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
					for="tab-1" class="tab">Customer</label> <input id="tab-2"
					type="radio" name="tab" class="sign-up"><label for="tab-2"
					class="tab">Agent</label>
				<div class="login-form">
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label">Username</label> <input
								id="userC" name="userC" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">Password</label> <input
								id="passC" name="passC" type="password" class="input"
								data-type="password">
						</div>
						<div class="group">
							<input type="submit" class="button" value="Sign In">
						</div>
						<div class="hr"></div>
						<!-- <div class="foot-lnk">
					<a href="#forgot">Forgot Password?</a>
				</div> -->
					</div>
					<div class="login-htm">
						<div class="group">
							<label for="user" class="label">Username</label> <input
								id="userP" name="userP" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">Password</label> <input
								id="passP" name="passP" type="password" class="input"
								data-type="password">
						</div>
						<!--<div class="group">
					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span> Keep me Signed in</label>
				</div>-->
						<div class="group">
							<input type="submit" class="button" value="Sign In">
						</div>
						<div class="hr"></div>
						<!--<div class="foot-lnk">
					<a href="#forgot">Forgot Password?</a>
				</div>	-->
					</div>
					<h2 style="color: red">
						<%
							out.println(msg);
						%>
					</h2>

				</div>
			</div>
		</div>
	</form>

</body>
</html>
