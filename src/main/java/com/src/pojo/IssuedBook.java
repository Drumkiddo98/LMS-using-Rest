package com.src.pojo;

public class IssuedBook {
	public String sID;
	public String bID;
	
	
	
	@Override
	public String toString() {
		return "IssuedBook [sID=" + sID + ", bID=" + bID + "]";
	}
	public String getsID() {
		return sID;
	}
	public void setsID(String sID) {
		this.sID = sID;
	}
	public String getbID() {
		return bID;
	}
	public void setbID(String bID) {
		this.bID = bID;
	}

}
