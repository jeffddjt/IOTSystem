package com.bohechina.iotsystem.model;

public class Question {
	
	private int id;
	private String subject;
	private int type;
	private String itemText;
	private String itemRes;
	private String choiceA1;
	private String choiceB1;
	private String choiceC1;
	private String choiceD1;
	private String answer1;
	private String choiceA2;
	private String choiceB2;
	private String choiceC2;
	private String choiceD2;
	private String answer2;
	private int score;
	
	
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getItemText() {
		return itemText;
	}
	public void setItemText(String itemText) {
		this.itemText = itemText;
	}
	public String getItemRes() {
		return itemRes;
	}
	public void setItemRes(String itemRes) {
		this.itemRes = itemRes;
	}
	public String getChoiceA1() {
		return choiceA1;
	}
	public void setChoiceA1(String choiceA1) {
		this.choiceA1 = choiceA1;
	}
	public String getChoiceB1() {
		return choiceB1;
	}
	public void setChoiceB1(String choiceB1) {
		this.choiceB1 = choiceB1;
	}
	public String getChoiceC1() {
		return choiceC1;
	}
	public void setChoiceC1(String choiceC1) {
		this.choiceC1 = choiceC1;
	}
	public String getChoiceD1() {
		return choiceD1;
	}
	public void setChoiceD1(String choiceD1) {
		this.choiceD1 = choiceD1;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getChoiceA2() {
		return choiceA2;
	}
	public void setChoiceA2(String choiceA2) {
		this.choiceA2 = choiceA2;
	}
	public String getChoiceB2() {
		return choiceB2;
	}
	public void setChoiceB2(String choiceB2) {
		this.choiceB2 = choiceB2;
	}
	public String getChoiceC2() {
		return choiceC2;
	}
	public void setChoiceC2(String choiceC2) {
		this.choiceC2 = choiceC2;
	}
	public String getChoiceD2() {
		return choiceD2;
	}
	public void setChoiceD2(String choiceD2) {
		this.choiceD2 = choiceD2;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "Question [id=" + id + ", subject=" + subject + ", type=" + type
				+ ", itemText=" + itemText + ", itemRes=" + itemRes
				+ ", choiceA1=" + choiceA1 + ", choiceB1=" + choiceB1
				+ ", choiceC1=" + choiceC1 + ", choiceD1=" + choiceD1
				+ ", answer1=" + answer1 + ", choiceA2=" + choiceA2
				+ ", choiceB2=" + choiceB2 + ", choiceC2=" + choiceC2
				+ ", choiceD2=" + choiceD2 + ", answer2=" + answer2
				+ ", score=" + score + "]";
	}
	
	
	
}
