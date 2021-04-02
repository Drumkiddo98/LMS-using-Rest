package com.src.pojo;

public class Librarian {
	public String libID;
	public String libName;
	public String libMail;
	public String libPass;
	public String getLibID() {
		return libID;
	}
	public void setLibID(String libID) {
		this.libID = libID;
	}
	public String getLibName() {
		return libName;
	}
	public void setLibName(String libName) {
		this.libName = libName;
	}
	
	public String getLibMail() {
		return libMail;
	}
	public void setLibMail(String libMail) {
		this.libMail = libMail;
	}
	public String getLibPass() {
		return libPass;
	}
	public void setLibPass(String libPass) {
		this.libPass = libPass;
	}
	@Override
	public String toString() {
		return "Librarian [libID=" + libID + ", libName=" + libName + ", libEmail=" + libMail + ", libPass=" + libPass
				+ "]";
	}
	
}
