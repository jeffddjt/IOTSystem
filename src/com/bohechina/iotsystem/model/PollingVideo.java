package com.bohechina.iotsystem.model;

public class PollingVideo {
	private int id;
	private int no;
	private int type;
	private String name;
	private String path;
	
	
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
	public int getType(){
		return type;
	}
	
	public void setType(int type){
		this.type=type;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
