package com.bohechina.iotsystem.model;

public class Operation {
	private int id;
	private String subject;
	private String testVrp;
	private String examVrp;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTestVrp() {
		return testVrp;
	}
	public void setTestVrp(String testVrp) {
		this.testVrp = testVrp;
	}
	public String getExamVrp() {
		return examVrp;
	}
	public void setExamVrp(String examVrp) {
		this.examVrp = examVrp;
	}
	@Override
	public String toString() {
		return "Operation [id=" + id + ", subject=" + subject + ", testVrp="
				+ testVrp + ", examVrp=" + examVrp + "]";
	}
	
	
	
}
