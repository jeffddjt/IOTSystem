package com.bohechina.iotsystem.model;

public class ExamPaperDetail {
	private int id;
	private int examPaperID;
	private int questionNo;
	private String questionSubject;
	private String questionCategory;
	private int questionID;
	private Question question;
	private String stu_answer1;
	private String stu_answer2;
	private String answer1;
	private String answer2;
	private double stu_score;
	private double score;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getExamPaperID() {
		return examPaperID;
	}
	public void setExamPaperID(int examPaperID) {
		this.examPaperID = examPaperID;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getQuestionSubject() {
		return questionSubject;
	}
	public void setQuestionSubject(String questionSubject) {
		this.questionSubject = questionSubject;
	}
	public String getQuestionCategory() {
		return questionCategory;
	}
	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public String getStu_answer1() {
		return stu_answer1;
	}
	public void setStu_answer1(String stu_answer1) {
		this.stu_answer1 = stu_answer1;
	}
	public String getStu_answer2() {
		return stu_answer2;
	}
	public void setStu_answer2(String stu_answer2) {
		this.stu_answer2 = stu_answer2;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public double getStu_score() {
		return stu_score;
	}
	public void setStu_score(double stu_score) {
		this.stu_score = stu_score;
	}

}
