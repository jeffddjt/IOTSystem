package com.bohechina.iotsystem.model;

public class VrpQuestion {
	private int id;
	private String subject;
	private int type;
	private String itemText;
	private String itemRes;
	private double score;
	
	public VrpQuestion(){
		this.itemRes="NoVrp";
	}
	
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
	
	public String getItemText(){
		return itemText;
	}
	
	public void setItemText(String itemText){
		this.itemText=itemText;
	}
	
	public String getItemRes() {
		return itemRes;
	}
	public void setItemRes(String itemRes) {
		this.itemRes = itemRes;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "VrpQuestion [id=" + id + ", subject=" + subject + ", type="
				+ type + ", itemRes=" + itemRes + ", score=" + score + "]";
	}
	
	
}
