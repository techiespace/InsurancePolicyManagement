<%@ page import="JDBC.jsp.*"%>

<html>
<% int id = (Integer) session.getAttribute("Id"); 
String pol_no = request.getParameter("pol_no");
int total=new custInvestments().myInvestments(pol_no,id);
double i=1.05*total;
%>
<script type="text/javascript">
	$(document).ready(function() {

		$(".SureSurrender").click(function() {
	         var pol_no=<%=pol_no%>;
			$('#main').load('SurrenderFinal.jsp?pol_no='+pol_no);
		});
		$(".backToMyPolicies").click(function() {
			$('#main').load('myPolicies.jsp');
		});

	});
	</script>



<b>Total Investments:</b><%=total%>
<br></br>
<b>Surrender Value:</b><%=i%>


<div>
	<button type="button" style="margin-left: 30%; margin-top: 30%;"
		class="btn btn-danger SureSurrender">Yes,I am Sure</button>

</div>

<div>
	<button type="button" style="margin-left: 50%; margin-top: -4%;"
		class="btn btn-danger backToMyPolicies">No</button>
</div>

</html>