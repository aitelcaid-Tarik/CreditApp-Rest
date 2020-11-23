<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.fsr.iao.*,com.fsr.iao.creditClient.*"%>


<!DOCTYPE html>
<html>
<head>
<title>SE CONNECTER</title>
<meta charset="UTF-8">

<link rel="icon" type="image/png" href="table/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/css/util.css">
<link rel="stylesheet" type="text/css" href="login/css/main.css">
<!--===============================================================================================-->
</head>


<%


CreditClient credit = new CreditClient();


MyClient client = new MyClient();
String error = "";

if (request.getParameter("signIn") != null) {

	
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");

	 client = credit.login(email, pass);

		if (client == null)
	response.sendRedirect("./SeConnecter.jsp");

	request.getSession().setAttribute("client", client);

		if (request.getSession().getAttribute("client") != null) {
	response.sendRedirect("index.jsp?monCompte");
		}	
}
%>



<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form method="post"
					class="login100-form validate-form p-l-55 p-r-55 p-t-178"
					action="SeConnecter.jsp">
					<span class="login100-form-title"> SE CONNECTER </span>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Entrez votre Email svp">
						<input class="input100" type="email" name="email"
							placeholder="E-mail"> <span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Entrez votre Mot de passe">
						<input class="input100" type="password" name="pass"
							placeholder="Mot de passe"> <span class="focus-input100"></span>
					</div>

					<div class="text-right p-t-13 p-b-23">
						<span class="txt1">J'ai oublié </span> <a href="#" class="txt2">
							E-mail / Mot de passe ? </a>
					</div>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn" name="signIn">Connexion</button>
					</div>

					<div class="flex-col-c p-t-170 p-b-40">
						<span class="txt1 p-b-9"> Je n'ai pas de compte? </span> <a
							href="CreerUnCompte.jsp" class="txt3"> Créer un compte </a>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!--===============================================================================================-->
	<script src="login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="login/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="login/vendor/bootstrap/js/popper.js"></script>
	<script src="login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="login/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="login/vendor/daterangepicker/moment.min.js"></script>
	<script src="login/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="login/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="login/js/main.js"></script>

</body>
</html>