package com.fsr.iao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/credit")
public class CreditWS {

	public final static int DEMAIL = -1;

	@GET
	@Path("/calculAnnuelle/{taux}")
	@Produces(MediaType.APPLICATION_JSON)
	public double calculAnnuelle(@PathParam("taux") double t) {

		return Math.pow(1 + t, (double) 1 / 12) - 1;
	}

	@GET
	@Path("/calculAnnuite/{capital}/{taux}/{duree}")
	@Produces(MediaType.APPLICATION_JSON)
	public double calculAnnuite(@PathParam("capital") double c, @PathParam("taux") double t,
			@PathParam("duree") long d) {

		double taux = calculAnnuelle(t);

		return (Math.pow(1 + taux, d) * taux * c) / (Math.pow(1 + taux, d) - 1);

	}

	@GET
	@Path("/calculCapital/{annuite}/{taux}/{duree}")
	@Produces(MediaType.APPLICATION_JSON)
	public double calculCapital(@PathParam("annuite") double a, @PathParam("taux") double t,
			@PathParam("duree") long d) {

		double taux = calculAnnuelle(t);

		return (Math.pow(1 + taux, d) * a - a) / (Math.pow(1 + taux, d) * taux);
	}

	@GET
	@Path("/calculDuree/{capital}/{taux}/{annuite}")
	@Produces(MediaType.APPLICATION_JSON)
	public long calculDuree(@PathParam("capital") double c, @PathParam("taux") double t,
			@PathParam("annuite") double a) {
		double taux = calculAnnuelle(t);

		return (long) ((Math.log(a / (a - taux * c)) / (Math.log(1 + taux))) + 0.5);
	}

	@GET
	@Path("/insertClient/{nomCli}/{email}/{pass}")
	@Produces(MediaType.APPLICATION_JSON)
	public int insertClient(@PathParam("nomCli") String nomCli, @PathParam("email") String email,
			@PathParam("pass") String pass) {
		int statut = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection ma_connexion = DriverManager.getConnection("jdbc:mysql://localhost:8889/CreditApp", "root",
					"root");

			Statement mon_statement = ma_connexion.createStatement();

			ResultSet rs = mon_statement.executeQuery("SELECT Email FROM Client WHERE Email = '" + email + "'");

			if (rs.next()) {

				return DEMAIL;
			}
			statut = mon_statement.executeUpdate("INSERT INTO `Client` (`NomCli`, `Email`, `MotDePasse`) VALUES ('"
					+ nomCli + "', '" + email + "', '" + pass + "')");

			mon_statement = ma_connexion.createStatement();

			String query = "SELECT LAST_INSERT_ID()";

			rs = mon_statement.executeQuery(query);

			rs.next();

			statut = rs.getInt(1);

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return statut;
	}

	@GET
	@Path("/login/{email}/{pass}")
	@Produces(MediaType.APPLICATION_JSON)
	public MyClient login(@PathParam("email") String email, @PathParam("pass") String pass) {

		MyClient client = new MyClient();
		client.setNumCli(-1);

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection ma_connexion = DriverManager.getConnection("jdbc:mysql://localhost:8889/CreditApp", "root",
					"root");

			Statement mon_statement = ma_connexion.createStatement();

			ResultSet rs = mon_statement.executeQuery(
					"SELECT * FROM Client WHERE Email = '" + email + "' AND  MotDePasse =  '" + pass + "'");

			if (rs.next()) {

				client = new MyClient();

				client.setNumCli(rs.getInt("NumCli"));
				client.setNomCli(rs.getString("NomCli"));
				client.setEmail(rs.getString("Email"));

			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return client;

	}

	@GET
	@Path("/insertCredit/{capital}/{duree}/{taux}/{annuite}/{numclient}")
	@Produces(MediaType.APPLICATION_JSON)
	public int insertCredit(@PathParam("capital") double capital, @PathParam("duree") long duree,
			@PathParam("taux") double taux, @PathParam("annuite") double annuite,
			@PathParam("numclient") int numclient) {

		int statut = -1;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection ma_connexion = DriverManager.getConnection("jdbc:mysql://localhost:8889/CreditApp", "root",
					"root");

			Statement mon_statement = ma_connexion.createStatement();

			statut = mon_statement.executeUpdate(

					"INSERT INTO `Credit` (`MonCre`, `DurCre`, `TauCre`, `AnnCre`, `NumCli`)"

							+ " VALUES ('" + capital + "', '" + duree + "', '" + taux + "', '" + annuite + "', '"
							+ numclient + "')");

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return statut;

	}

	@GET
	@Path("/getAllCredit/{numCli}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Credit> getAllCredit(@PathParam("numCli") int numCli) {
		List<Credit> list = new LinkedList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection ma_connexion = DriverManager.getConnection("jdbc:mysql://localhost:8889/CreditApp", "root",
					"root");

			Statement mon_statement = ma_connexion.createStatement();

			ResultSet rs = mon_statement.executeQuery("SELECT * FROM Credit WHERE NumCli ='" + numCli + "'");

			while (rs.next()) {

				Credit credit = new Credit();

				credit.setCapital(rs.getDouble("MonCre"));
				credit.setTaux(rs.getDouble("TauCre"));
				credit.setAnnuite(rs.getDouble("AnnCre"));
				credit.setDuree(rs.getLong("DurCre"));
				credit.setDate(rs.getString("DatCred"));
				credit.setNumCre(rs.getInt("NumCre"));
				credit.setNumclient(rs.getInt("NumCli"));

				list.add(credit);

			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}

		return list;
	}

}
