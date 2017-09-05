package com.bohechina.iotsystem.model;

import java.util.Date;


public class ProjectInfo{
	
	private int id;
	private String title;
	private String text;
    private Date createTime;
    private Date lastUpdateTime;
    private boolean status;
    
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ProjectInfo [id=" + id + ", title=" + title + ", text=" + text
				+ ", createTime=" + createTime + ", lastUpdateTime="
				+ lastUpdateTime + ", status=" + status + "]";
	}
    	
	
}
