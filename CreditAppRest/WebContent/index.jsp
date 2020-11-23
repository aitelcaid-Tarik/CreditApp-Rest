<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.fsr.iao.MyClient,java.text.DecimalFormat"%>


<%@ page import="java.io.IOException,java.rmi.RemoteException"%>

<%@ page
	import="java.sql.ResultSet,java.sql.SQLException,java.sql.Statement"%>

<html>
<head>
<meta charset="UTF-8">
<title>TD BANK</title>

<link rel="stylesheet" href="style.css">


<link rel="icon" type="image/png" href="table/images/icons/favicon.ico" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>

<%

MyClient client = (MyClient)request.getSession().getAttribute("client");

if (client == null) {
	response.sendRedirect("./SeConnecter.jsp");
}
%>




<body>


	<!-- navbar  <i class="fas fa-user">  -->


	<nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">
		<div class="container">

			<a href="#" class="navbar-brand"> <img src="logo.png" width="45"
				alt="" class="d-inline-block align-middle mr-2"> <span
				class="text-uppercase font-weight-bold">BANK</span>
			</a>

			<div>
				<ul class="navbar-nav  ulmarg">

					<li class="nav-item "><a class="n nav-link " href="index.jsp">
							<i class="fas fa-bell"></i> ANNUITE
					</a></li>

					<li class="nav-item "><a class="n nav-link "
						href="?calculCapital"> <i class="fas fa-weight"></i> CAPITAL
					</a></li>

					<li class="nav-item"><a class="n nav-link" href="?calculDuree">
							<i class="fas fa-user-clock"></i> DUREE
					</a></li>

				</ul>
			</div>

			<div id="cnav2">
				<ul class="nav navbar-nav navbar-right">

					<li class="nav-item"><a class="n nav-link" href="?monCompte">
							<i class="fas fa-user"></i> MON COMPTE
					</a></li>

					<li class="nav-item"><a class="n nav-link"
						href="SeDeconnecter.jsp"> <i class="fas fa-sign-out-alt"></i>
							SE DECONNECTER
					</a></li>

				</ul>

			</div>
		</div>

	</nav>

	<!-- end navbar -->

	<%
		if (request.getParameter("monCompte") != null) {
	%>

	<jsp:include page="./WEB-INF/monCompte.jsp" />


	<%
		} else {
	%>

	<!-- start slider -->

	<section id="slider" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#slider" data-slide-to="0" class="active"></li>

			<li data-target="#slider" data-slide-to="1"></li>

			<li data-target="#slider" data-slide-to="2"></li>

		</ul>

		<div class="carousel-inner">

			<div class="carousel-item active">
				<img src="slide/slide1.jpg" alt="slide1" width="100%"
					height="550 px">
				<div class="carousel-caption"></div>
			</div>

			<div class="carousel-item  ">
				<img src="slide/slide2.jpg" alt="slide2" width="100%" height="550px">
				<div class="carousel-caption"></div>
			</div>

			<div class="carousel-item ">
				<img src="slide/slide3.jpg" alt="slide3" width="100%" height="550px">
				<div class="carousel-caption"></div>
			</div>

		</div>

		<a class="carousel-control-prev" href="#slider" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#slider" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>

	</section>

	<!-- end of slider section -->

	<%
		if (request.getParameter("calculCapital") != null) {
	%>

	<jsp:include page="./WEB-INF/capital.jsp" />

	<%
		} else if (request.getParameter("calculDuree") != null) {
	%>

	<jsp:include page="./WEB-INF/duree.jsp" />

	<%
		} else if (request.getParameter("resultAnn") != null) {
	%>

	<jsp:include page="./WEB-INF/result_ann.jsp" />
	<%
		} else if (request.getParameter("resultCap") != null) {
	%>

	<jsp:include page="./WEB-INF/result_cap.jsp" />
	<%
		} else if (request.getParameter("resultDur") != null) {
	%>

	<jsp:include page="./WEB-INF/result_dur.jsp" />
	<%
		} else {
	%>

	<jsp:include page="./WEB-INF/annuite.jsp" />


	<%
		}

	}
	%>
</body>
</html>







