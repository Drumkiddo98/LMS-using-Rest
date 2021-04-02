package com.src.pojo;

public class Student {
	public String studentId;
	public String studentName;
	public String studentMail;
	public String studentPass;
	
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	
	public String getStudentName() {
		return studentName;
	}
	
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentMail() {
		return studentMail;
	}
	public void setStudentMail(String studentMail) {
		this.studentMail = studentMail;
	}
	public String getStudentPass() {
		return studentPass;
	}
	public void setStudentPass(String studentPass) {
		this.studentPass = studentPass;
	}
	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", studentName=" + studentName + ", studentMail=" + studentMail
				+ ", studentPass=" + studentPass + "]";
	}
	
}
