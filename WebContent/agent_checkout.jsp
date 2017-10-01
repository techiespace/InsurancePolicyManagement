
<%@ page import="java.sql.*,JDBC.jsp.*,a_JDBC.jsp.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Responsive Shopping Cart</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="CSS/paystyle.css">



<%
	String pol = request.getParameter("pol_no");
	int pol_no = Integer.parseInt(pol);
	int agent_id = (Integer) session.getAttribute("Id");
	int cust_id = new Get_cust().get_id(agent_id, pol_no);
	int details[] = new Prem_amount().p_details(pol_no);
	int premium = details[0];
	int commision = details[1];
	int late_fee = details[2];
	int act_latefee = 0;
	int day_diff = new Premium().date(cust_id, pol_no);
	//out.println("Day-Diff:"+day_diff);
	if (day_diff < 0) {
		act_latefee = late_fee;
	} else if (day_diff > 0) {
		act_latefee = 0;
	}
	double tax = (premium + act_latefee) * 0.05;
	double total = premium + tax + act_latefee;
	double perc = commision / 100.00;
	System.out.println("acom:" + commision);
	System.out.println("perc:" + perc);
	double commision1 = premium * perc;
	System.out.println("Com:" + commision1);
%>

<script type="text/javascript" src="dashboard/vendor/jquery/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#pay_done").click(function() {
<%new Invoice().enter(cust_id, agent_id, total, pol_no, commision1);%>
	});
	
			});
</script>

</head>

<body>

	<div class="shopping-cart">
		<br>
		<h1>Policy Payment</h1>
		<br>
		<div class="column-labels">
			<label class="product-details">Product</label>
			<label class="product-name">Customer Name</label>
			<label class="product-price">Policy Number</label>
			<label class="product-quantity">Term</label> 
			<label class="product-line-price">Cost</label>
		</div>
		<div class="product">
			<div class="product-details">
				<div class="product-title">
					<%
						String pol_name = new Prem_name().p_name(pol_no);
						out.println("<h3>" + pol_name + "</h3>");
					%>
				</div>
			</div>
			<div class="product-name">
					<%
					String name[]=new Cust_name().c_name(cust_id);
					String first=name[0];
					String mid=name[1];
					String last=name[2];
					String full=first+" "+mid+" " +last;
						out.println("<h3>" + full + "</h3>");
					%>
			</div>
			<div class="product-price" id="pol">
				<%
					out.println(pol_no);
				%>
			</div>
			<div class="product-quantity">
				<%
					Date e_date = new Prem_date().due_date(cust_id, pol_no);
					Date s_date = new Term().term_date(cust_id, pol_no);
					out.println(s_date + " to " + e_date);
				%>
			</div>
			<div class="product-line-price">
				<%
					out.println("INR " + premium);
				%>
			</div>
		</div>

		<div class="totals">
			<div class="totals-item">
				<label>Late Fee</label>
				<div class="totals-value" id="cart-shipping">
					<%
						out.println("INR " + act_latefee);
					%>
				</div>
			</div>
			<div class="totals-item">
				<label>Tax (5%)</label>
				<div class="totals-value" id="cart-tax">
					<%
						out.println("INR " + tax);
					%>
				</div>
			</div>

			<div class="totals-item totals-item-total">
				<label>Grand Total</label>
				<div class="totals-value" id="cart-total">
					<%
						out.println("<h4>INR " + total + "</h4>");
					%>
				</div>
			</div>
		</div>
		<a id="pay_done"
			style="color: white; margin-left: 82%; margin-right: 5%; font-size: 1.2em; margin-top: 16%;"
			class="nav-link btn btn-primary" data-toggle="modal"
			data-target="#exampleModal1"> <i class="fa fa-fw fa-sign-out"></i>
			Checkout
		</a>
		<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Checkout</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						Transaction Successful! <br> Reference id: 432423
					</div>
					<div class="modal-footer">
						<a class="btn btn-primary" href="aindex.jsp">Yay!</a>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="js/payment.js"></script>

</body>
</html>
