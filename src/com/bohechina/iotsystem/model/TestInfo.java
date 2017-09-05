package com.bohechina.iotsystem.model;

public class TestInfo extends BaseModel {
	
	private String subject;
	private String category;
	private String testName;
	private int singleQuestionCount;
	private int multipleQuestionCount;
	private int whetherQuestionCount;
	private int vrpQuestionCount;
	private int duration;
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

	public int getSingleQuestionCount() {
		return singleQuestionCount;
	}
	public void setSingleQuestionCount(int singleQuestionCount) {
		this.singleQuestionCount = singleQuestionCount;
	}
	public int getMultipleQuestionCount() {
		return multipleQuestionCount;
	}
	public void setMultipleQuestionCount(int multipleQuestionCount) {
		this.multipleQuestionCount = multipleQuestionCount;
	}
	public int getWhetherQuestionCount() {
		return whetherQuestionCount;
	}
	public void setWhetherQuestionCount(int whetherQuestionCount) {
		this.whetherQuestionCount = whetherQuestionCount;
	}
	public int getVrpQuestionCount() {
		return vrpQuestionCount;
	}
	public void setVrpQuestionCount(int vrpQuestionCount) {
		this.vrpQuestionCount = vrpQuestionCount;
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
	
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	@Override
	public String toString() {
		return "TestInfo [subject=" + subject + ", category=" + category
				+ ", testName=" + testName + ", singleQuestionCount="
				+ singleQuestionCount + ", multipleQuestionCount="
				+ multipleQuestionCount + ", whetherQuestionCount="
				+ whetherQuestionCount + ", vrpQuestionCount="
				+ vrpQuestionCount + ", duration=" + duration + ", experience="
				+ experience + ", exp=" + exp + "]";
	}

	
	
	

}
