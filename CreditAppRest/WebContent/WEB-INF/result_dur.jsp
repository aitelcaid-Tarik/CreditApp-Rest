<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="com.fsr.iao.*,java.text.DecimalFormat,com.fsr.iao.creditClient.*"%>

<%@ page import="java.rmi.RemoteException"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>TD BANK</title>

<link rel="stylesheet" href="style.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">


</head>



<%
	MyClient client = (MyClient) request.getSession().getAttribute("client");
String error = "";

double capital = 0, taux = 0, annuite = 0;
long duree = 0, r = -1;
int numclient = 0;

try {

	capital = Double.parseDouble(request.getParameter("capital").trim());

	taux = Double.parseDouble(request.getParameter("taux").trim());

	annuite = Double.parseDouble(request.getParameter("annuite").trim());

	CreditClient credit = new CreditClient();

	duree = Long.parseLong(new DecimalFormat("##.##").format(credit.calculDuree(capital, taux, annuite)));

	numclient = client.getNumCli();

	r = credit.insertCredit(capital, duree, taux, annuite, numclient);

} catch (Exception e) {

	e.printStackTrace();
}

if (r == -1)
	error = " ERROR ";
%>



<body>


	<form action="?calculDuree" method="post">
		<div class="container2"></div>

		<div class="section1 text-center">

			<button type="submit" class="btn btn-rounded btn-success btn-lg">
				Duree calculee :
				<%=duree%>
				mois <i class="fas far fa-check-circle pl-1"></i>
			</button>
			<pre>
	
</pre>
		</div>

	</form>

</body>
</html>





