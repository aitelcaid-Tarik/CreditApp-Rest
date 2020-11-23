<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.fsr.iao.*,com.fsr.iao.creditClient.*"%>


<!DOCTYPE html>
<html>
<head>
<title>Mon Compte</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">


<link rel="stylesheet" type="text/css"
	href="creditCard/css/font-awesome.min.css" />

<link rel="stylesheet" type="text/css" href="creditCard/css/styles.css" />


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="table/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="table/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="ftable/onts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="table/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="table/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="table/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="table/css/util.css">
<link rel="stylesheet" type="text/css" href="table/css/main.css">
<!--===============================================================================================-->


</head>


<%
	Credit[] c = null;

MyClient client = (MyClient) request.getSession().getAttribute("client");

try {


	CreditClient credit = new CreditClient();

	c = credit.getAllCredit(client.getNumCli());

} catch (Exception e) {
}
%>

<body>


	<div class="limiter">



		<div class="container-table100">
			<div class="wrap-table100">

				<%
					if (c != null && c.length > 0) {
				%>


				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column0">#</th>
									<th class="cell100 column1">Montant</th>
									<th class="cell100 column2">Durée</th>
									<th class="cell100 column3">Taux</th>
									<th class="cell100 column4">Annuité</th>
									<th class="cell100 column5">Date</th>
								</tr>
							</thead>
						</table>
					</div>



					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<%
									for (int i = 0; i < c.length; i++) {
								%>
								<tr class="row100 body">
									<td class="cell100 column0"><%=i+1%></td>
									<td class="cell100 column1"><%=c[i].getCapital()%></td>
									<td class="cell100 column2"><%=c[i].getDuree()%></td>
									<td class="cell100 column3"><%=c[i].getTaux()%></td>
									<td class="cell100 column4"><%=c[i].getAnnuite()%></td>
									<td class="cell100 column5"><%=c[i].getDate().substring(0, c[i].getDate().length() - 2)%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>

				</div>

				<%
					}
				%>
				<div class="my-cc ">
					<div class="container">

						<div class="row align-items-center">

							<div class=" my-auto col-md-6 col-sm-6 col-xs-12">
								<!-- Card -->
								<div class="item item-000-bg item-image"
									style="background-image: url('creditCard/images/bg-1.jpg');">
									<!-- Transparent Image -->
									<img src="creditCard/images/transparent.png" alt=""
										class="img-responsive" />
									<!-- Heading -->
									<div class="item-heading item-000-bg clearfix">
										<!-- Heading -->
										<h3>Debit Card</h3>
										<!-- Bank Name -->
										<h4>TD Bank</h4>
									</div>
									<!-- Account -->
									<div class="item-account">
										<!-- Value -->
										<span><%=1234 + client.getNumCli()%></span> <span><%=5678 + client.getNumCli()%></span>
										<span><%=7811 + client.getNumCli()%></span> <span><%=2345 + client.getNumCli()%></span>
									</div>
									<!-- Validity Starts -->
									<div class="item-validity">
										<div class="row align-items-center">
											<div class="col-md-6 col-sm-6 col-xs-6">
												<!-- Item -->
												<div class="item-valid clearfix">
													<!-- Valid From -->
													<h5>Valid From</h5>
													<!-- Date -->
													<span>11/20</span>
												</div>
											</div>
											<div class="col-md-6 col-sm-6 col-xs-6">
												<!-- Item -->
												<div class="item-valid clearfix">
													<!-- Valid Thru -->
													<h5>Valid Thru</h5>
													<!-- Date -->
													<span>11/22</span>
												</div>
											</div>
										</div>
									</div>
									<!-- Validity Ends -->

									<!-- Card Type Starts -->
									<div class="item-cc-type clearfix">
										<!-- Type -->
										<h6>
											MR
											<%=client.getNomCli()%>
										</h6>
										<!-- Icon -->
										<i class="fa fa-cc-visa"></i>
									</div>
									<!-- Card Type Ends -->
								</div>
							</div>



						</div>
					</div>
				</div>



			</div>
		</div>
	</div>



	<!--===============================================================================================-->
	<script src="table/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="table/vendor/bootstrap/js/popper.js"></script>
	<script src="table/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="table/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="table/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="table/js/main.js"></script>






</body>

</html>