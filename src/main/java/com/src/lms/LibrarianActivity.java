package com.src.lms;



import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


import com.src.db.DB;
import com.src.pojo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.websocket.server.PathParam;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;

@Path("librarian")
public class LibrarianActivity {
	@POST
 	@Path("addlibrarian")
		public void addlibrarian(String json) throws ParseException {
		JSONParser parser = new JSONParser();
		 JSONObject jsonObject = (JSONObject) parser.parse(json);
		 Librarian lb = new Librarian();
		 lb.libID = (String) jsonObject.get("libid");
		 lb.libName=(String) jsonObject.get("libname");
		 lb.libMail=(String) jsonObject.get("libmail");
		 lb.libPass=(String) jsonObject.get("libpass");
		 DB.addLibrarianInList(lb);
	}
	@POST
 	@Path("checklibrarian")
	@Produces(MediaType.APPLICATION_JSON)
	public	String  checklibrarian(String json) throws ParseException {
		 System.out.println("Hello");
		 JSONParser parser = new JSONParser();
		 JSONObject jsonObject = (JSONObject) parser.parse(json);
		 String libmail=(String) jsonObject.get("libmail");
		 String libpass=(String) jsonObject.get("libpass");
		 Boolean check=DB.checkLibList(libmail,libpass);
			/* System.out.println("Hello"); */
		 if(check == true) {
				/* System.out.println(check+"1"); */
			 return "1";
		 }
		 else {
				/* System.out.println("2"); */
			 return "2";
		}
	}
	@POST
		@Path("addbook")
		@Produces(MediaType.APPLICATION_JSON)
			public String bookadd(String json) throws ParseException {
				JSONParser parser = new JSONParser();
				JSONObject jsonObject = (JSONObject) parser.parse(json);
				Book bk = new Book();
				bk.bookId= (String) jsonObject.get("bookid");
				bk.bookName=(String) jsonObject.get("bookname");
				bk.bookAuthor=(String) jsonObject.get("bookauthor");
				bk.bookPrice=(String) jsonObject.get("bookprice");
				System.out.println(bk.toString());
				DB.addBookInList(bk);
				return json;
		
	}
	@POST 
	 	@Path("issuebook")
		public String issuebook(String json) throws ParseException {
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(json);
		IssuedBook ibk = new IssuedBook();
		ibk.bID= (String) jsonObject.get("bookid");
		ibk.sID= (String) jsonObject.get("studid");
		if(DB.checkStudent(ibk.sID)) {
		DB.addIssuedBookInList(ibk);
		return "1";
		}
		else {
			return "2";
		}
		
		
	}
	@POST
		@Path("deletebook")
		public void deletebook(String json) throws ParseException {
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(json);
		String bid= (String) jsonObject.get("bookid");		
		System.out.println("bid"+bid);
		for (IssuedBook ibk : DB.issuedBookList) {
			if(ibk.getbID().contains(bid)) {
				DB.issuedBookList.remove(ibk);
				break;
			}
			
		}
			}
}
		
	
	

