package com.bohechina.iotsystem.model;

public class Demo {
	private int id;
	private int no;
	private String subject;
	private String name;
	private String flowText;
	private String flow;
	private String intro;
	private String vrp;
	private int k;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getFlowText(){
		return flowText;
	}
	
	public void setFlowText(String flowText){
		this.flowText=flowText;
	}
	
	public String getFlow() {
		return flow;
	}
	public void setFlow(String flow) {
		this.flow = flow;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getVrp() {
		return vrp;
	}
	public void setVrp(String vrp) {
		this.vrp = vrp;
	}
	@Override
	public String toString() {
		return "Demo [id=" + id + ", subject=" + subject + ", name=" + name
				+ ",flowText="+flowText+", flow=" + flow + ", intro=" + intro + ", vrp=" + vrp + "]";
	}
	
	
}
