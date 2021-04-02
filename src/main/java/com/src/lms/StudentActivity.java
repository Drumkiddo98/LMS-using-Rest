package com.src.lms;


import jakarta.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.src.db.DB;
import com.src.pojo.Student;

import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;

@Path("student")
public class StudentActivity {
	
	 @POST
	 	@Path("addstudent")
	 	
	 	public void addStudent(String json) throws ParseException{
		 JSONParser parser = new JSONParser();
		 JSONObject jsonObject = (JSONObject) parser.parse(json);
		 Student st =new Student();
		 st.studentId=(String) jsonObject.get("studid");
		 st.studentName=(String) jsonObject.get("studname");
		 st.studentMail=(String) jsonObject.get("studmail");
		 st.studentPass=(String) jsonObject.get("studpass");
		 DB.addStudentInList(st);
	 }
	 @POST
	 	@Path("checkstudent")
	 	public String checkstudent(@Context HttpServletRequest req,String json) throws ParseException {
		 JSONParser parser = new JSONParser();
		 JSONObject jsonObject = (JSONObject) parser.parse(json);
		 String studentMail=(String) jsonObject.get("studmail");
		 String studentPass=(String) jsonObject.get("studpass");
		 HttpSession session = req.getSession(true); 
	     session.setAttribute("studmail",studentMail);
		 Boolean check= DB.checkStudList(studentMail,studentPass);
		 if(check == true){
			 return "1";
		 }
		 else{
			 return "2";
		}
		 
	 }
}

