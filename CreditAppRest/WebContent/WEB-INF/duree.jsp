<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>

<head>

<title></title>
<meta charset="UTF-8">

<!--===============================================================================================-->
<link rel="icon" type="image/png" href="form/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="form/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="form/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="form/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="form/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="form/css/util.css">
<link rel="stylesheet" type="text/css" href="form/css/main.css">
<!--===============================================================================================-->
</head>


<body>

	<form action="?resultDur" method="post">

		<div class="limiter">
			<div class="container-table100">
				<div class="wrap-table100">
					<div class="table100 ver1 ">
						<div class="table100-head">
							<table>
								<thead>
									<tr class="row100 head">
										<th class="cell100 column0">CAPITAL</th>
										<th class="cell100 column1">TAUX</th>
										<th class="cell100 column2">ANNUITE</th>
									</tr>
								</thead>
							</table>
						</div>

						<div class="table100-body ">
							<table>
								<tbody>
									<tr class="row100 body">
										<td class="cell100 column0"><input type="text"
											name="capital" placeholder="Entrez  le capital  "></td>

										<td class="cell100 column1"><input type="text"
											name="taux" placeholder="Entrez  le taux  "></td>
										<td class="cell100 column2"><input type="text"
											name="annuite" placeholder="Entrez  l'annuite  "></td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>





			<div class="section1 text-center">
				<button type="submit" class="btn btn-rounded btn-success btn-lg">
					Calculer & Sauvegarder <i class="fas far fa-check-circle pl-1"></i>
				</button>

			</div>
		</div>

	</form>

</body>
</html>
