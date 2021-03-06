package com.serviddio.gis.rest;



import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import org.json.*;


import javax.ws.rs.core.MediaType;

import com.serviddio.gis.model.DAOUser;
import com.serviddio.gis.tools.Crittog;




@Path("login")
public class LoginRest {

	/**
	 * Method handling HTTP GET requests. The returned object will be sent to
	 * the client as "text/plain" media type.
	 *
	 * @return String that will be returned as a text/plain response.
	 */
	
	@GET
	@Produces(MediaType.TEXT_HTML)
	public String getHtmlMessage() {
		// Return some cliched textual content
		return "<h1 align=\"center\">Server Up ...<h1>";
	}

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public String checkLogin(String msg) {
		
		System.out.println("Stringa di input"+msg);
		JSONObject req= new JSONObject(msg);
		Boolean firstControl= DAOUser.getIstance().checkArchived(req.getString("user_email"));
		
		
		if (!firstControl) {
	
		System.out.println("utente: "+req.getString("user_email"));
        System.out.println("password: "+req.getString("user_passw"));
		Boolean checked = DAOUser.getIstance().check(req.getString("user_email"),
				Crittog.getIstance().encrypt(req.getString("user_passw")));
		System.out.println("valore checked: "+checked.toString());
		if(checked){
			System.out.println("controllo superato");
		
			DAOUser.getIstance().setMobileTrue(req.getString("user_email"));
			
		}
		
		JSONObject resp = new JSONObject().put("login", checked.toString());

		return resp.toString();
		}
		else
		{
			JSONObject resp = new JSONObject().put("login", String.valueOf(false));
			System.out.println("utente locked ne blocco l'accesso");
			return resp.toString();
			 
		}
	
	}

}
