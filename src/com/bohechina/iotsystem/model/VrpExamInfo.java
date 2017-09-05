package com.bohechina.iotsystem.model;

import java.util.Date;

public class VrpExamInfo {

	private int id;
	private String examName;
	private int questionCount;
	private Date startTime;
	private Date stopTime;
	
	public VrpExamInfo(){
		this.startTime=new Date();
		this.stopTime=new Date();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public int getQuestionCount() {
		return questionCount;
	}
	public void setQuestionCount(int questionCount) {
		this.questionCount = questionCount;
	}
	public Date getStartTime(){
		return startTime;
	}
	public void setStartTime(Date startTime){
		this.startTime=startTime;
	}
	public Date getStopTime(){
		return stopTime;
	}
	public void setStopTime(Date stopTime){
		this.stopTime=stopTime;
	}
}
