<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.fsr.iao.*,com.fsr.iao.creditClient.*"%>

<!DOCTYPE html>
<html>
<title>Créer Mon Compte</title>
<meta charset="UTF-8">


<link rel="icon" type="image/png" href="table/images/icons/favicon.ico"/>

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

String error = "";

if (request.getParameter("signUp") != null) {

	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	String Cpass = request.getParameter("Cpass");

	int r = credit.insertClient(username, email, pass);
	
	
	if (pass != Cpass) error = "passwords dont match";
	

	if (r == -1) error = "Email Exists";

	else {

		MyClient client = credit.login(email, pass);

		if (client == null)
	response.sendRedirect("./CreerUnCompte.jsp");

		request.getSession().setAttribute("client", client);

		if (request.getSession().getAttribute("client") != null) {
	response.sendRedirect("index.jsp?monCompte");
		}
	}
}
%>



<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">

				<form method="post"
					class="login100-form validate-form p-l-55 p-r-55 p-t-178"
					action="#">
					<span class="login100-form-title"> Créer Mon Compte </span>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Entrer votre Nom Complet svp">
						<input class="input100" type="text" name="username"
							placeholder="Nom complet"> <span
							class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Entrer votre Email svp">
						<input class="input100" type="email" name="email"
							placeholder="Email"> <span
							class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Entrer votre Mot de passe svp">
						<input class="input100" type="password" name="pass"
							placeholder="Mot de passe"> <span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Confirmer votre mot de passe svp">
						<input class="input100" type="password" name="Cpass"
							placeholder="Confirmer votre mot de passe"> <span
							class="focus-input100"></span>
					</div>


					<pre>
					</pre>


					<div class="container-login100-form-btn m-b-16">
						<button type="submit" class="login100-form-btn" name="signUp">VALIDER</button>
					</div>

					<pre>
					</pre>


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