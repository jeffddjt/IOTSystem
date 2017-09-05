package com.bohechina.iotsystem.model;

public class ExamInfo extends BaseModel {
	
	private String subject;
	private String category;
	private String examName;
	private int qty;
	private int duration;
	private int score;
	private int experience;
	private boolean exp;
	
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}

	public boolean isExp() {
		return exp;
	}
	public void setExp(boolean exp) {
		this.exp = exp;
	}
	
	@Override
	public String toString() {
		return "ExamInfo [subject=" + subject + ", category=" + category
				+ ", examName=" + examName + ", qty=" + qty + ", duration="
				+ duration + ", score=" + score + ", experience=" + experience
				+ ", exp=" + exp + "]";
	}
	
	

}
