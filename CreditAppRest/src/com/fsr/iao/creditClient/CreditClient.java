package com.fsr.iao.creditClient;

import java.rmi.RemoteException;
import javax.ws.rs.core.MediaType;
import com.fsr.iao.MyClient;
import com.fsr.iao.Credit;
import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class CreditClient {

	public double calculAnnuelle(double taux) throws RemoteException {

		String uri = "http://localhost:8080/CreditAppRest/api/credit/calculAnnuite";

		uri += "/" + taux;

		Client c = Client.create();

		WebResource resource = c.resource(uri);

		String result = resource.get(String.class);

		return Double.parseDouble(result);

	}

	public double calculAnnuite(double capital, double t, long duree) throws RemoteException {

		String uri = "http://localhost:8080/CreditAppRest/api/credit/calculAnnuite";

		uri += "/" + capital;

		uri += "/" + t;

		uri += "/" + duree;

		Client c = Client.create();

		WebResource resource = c.resource(uri);

		String result = resource.get(String.class);

		return Double.parseDouble(result);
	}

	public double calculCapital(double annuite, double t, long duree) throws RemoteException {

		String uri = "http://localhost:8080/CreditAppRest/api/credit/calculCapital";

		uri += "/" + annuite;

		uri += "/" + t;

		uri += "/" + duree;

		Client c = Client.create();

		WebResource resource = c.resource(uri);

		String result = resource.get(String.class);

		return Double.parseDouble(result);
	}

	public long calculDuree(double capital, double t, double annuite) throws RemoteException {
		String uri = "http://localhost:8080/CreditAppRest/api/credit/calculDuree";

		uri += "/" + capital;

		uri += "/" + t;

		uri += "/" + annuite;

		Client c = Client.create();

		WebResource resource = c.resource(uri);

		String result = resource.get(String.class);

		return Long.parseLong(result);
	}

	public int insertClient(String nomCli, String email, String pass) throws RemoteException {
		String uri = "http://localhost:8080/CreditAppRest/api/credit/insertClient";

		uri += "/" + nomCli;

		uri += "/" + email;

		uri += "/" + pass;

		Client c = Client.create();

		WebResource resource = c.resource(uri);

		String result = resource.get(String.class);

		return Integer.parseInt(result);
	}

	public MyClient login(String email, String pass) throws RemoteException {
		
		String uri = "http://localhost:8080/CreditAppRest/api/credit/login";

		uri += "/" + email;

		uri += "/" + pass;

		Client c = Client.create();

		WebResource resource = c.resource(uri);

		ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);

		String output = response.getEntity(String.class);

		Gson gson = new Gson();

		MyClient client = gson.fromJson(output, MyClient.class);

		if (client.getNumCli() == -1) return null;
		
		return client;
				
	}

	public int insertCredit(double capital, long duree, double taux, double annuite, int numclient)
			throws RemoteException {

		String uri = "http://localhost:8080/CreditAppRest/api/credit/insertCredit";

		uri += "/" + capital;

		uri += "/" + duree;

		uri += "/" + taux;

		uri += "/" + annuite;

		uri += "/" + numclient;

		Client c = Client.create();

		WebResource resource = c.resource(uri);

		String result = resource.get(String.class);

		return Integer.parseInt(result);
	}

	public Credit[] getAllCredit(int numCli) {
		String uri = "http://localhost:8080/CreditAppRest/api/credit/getAllCredit";

		uri += "/" + numCli;

		Client c = Client.create();

		WebResource resource = c.resource(uri);

		ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);

		String output = response.getEntity(String.class);

		Gson gson = new Gson();

		Credit[] credits = gson.fromJson(output, Credit[].class);

		return credits;

	}

	public static void main(String[] args) {

		String uri2 = "http://localhost:8080/CreditAppRest/api/credit/login/aitelcaid.tarik@gmail.com/12345";

		Client c2 = Client.create();

		WebResource resource2 = c2.resource(uri2);

		ClientResponse response = resource2.get(ClientResponse.class);

		String output = response.getEntity(String.class);

		Gson gson = new Gson();

		MyClient client = gson.fromJson(output, MyClient.class);

		System.out.println(client);

	}

}
