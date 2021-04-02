package com.src.db;


import java.util.ArrayList;

import com.src.pojo.IssuedBook;
import com.src.pojo.Librarian;

import com.src.pojo.*;



public class DB {
	public static ArrayList<Student> studList= new ArrayList<Student>();
	public static ArrayList<Librarian> libList=new ArrayList<Librarian>();
	public static ArrayList<Book> bookList=new ArrayList<Book>();
	public static ArrayList<IssuedBook> issuedBookList=new ArrayList<IssuedBook>();
	
	public static void addStudentInList(Student st) {
		studList.add(st);
	}

	public static void addLibrarianInList(Librarian lb) {
		libList.add(lb);
		
	}
	public static void addBookInList(Book bk) {
		bookList.add(bk);
	}
	public static void addIssuedBookInList(IssuedBook ibk) {
		issuedBookList.add(ibk);
		
	}

	public static boolean checkLibList(String libmail, String libpass) {
		for (Librarian lb : libList) {
			if(lb.getLibMail().equals(libmail) && lb.getLibPass().equals(libpass)) {
				return true;
			}
			
		}
		return false;
		
	}
	public static boolean checkStudList(String studentMail,String studentPass) {
			
		for (Student st : studList) {
			if(st.getStudentMail().equals(studentMail) && st.getStudentPass().equals(studentPass))
					return true;
		}
		return false;
	}
	public static boolean checkStudent(String ID) {
		for (Student st : studList) {	
			if(ID.equals(String.valueOf(st.getStudentId())))
				return true;
		}
		return false;
	}

}
