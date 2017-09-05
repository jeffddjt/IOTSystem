package com.bohechina.iotsystem.model;

import java.util.Date;

public class ExamPaperView {
	private int id;
	private String examName;
	private String subject;
	private double totalScore;
	private double stu_score;
	private Date start_time;
	private Date stop_time;
	
	
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public double getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(double totalScore) {
		this.totalScore = totalScore;
	}
	public double getStu_score() {
		return stu_score;
	}
	public void setStu_score(double stu_score) {
		this.stu_score = stu_score;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getStop_time() {
		return stop_time;
	}
	public void setStop_time(Date stop_time) {
		this.stop_time = stop_time;
	}
	
	
}
