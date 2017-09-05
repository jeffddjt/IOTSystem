package com.bohechina.iotsystem.model;

public class StudentInfo {
	private String stu_id;           
	private String stu_name;         
	private String stu_pwd;           
	private int star_res;                
	private int star_dem;                
	private int star_mai;                
	private int star_dea;               
	private int star_ove;                
	private int stu_grade;                
	private int online_time;          
	private String stu_pic;
	
	

	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_pwd() {
		return stu_pwd;
	}
	public void setStu_pwd(String stu_pwd) {
		this.stu_pwd = stu_pwd;
	}
	public int getStar_res() {
		return star_res;
	}
	public void setStar_res(int star_res) {
		this.star_res = star_res;
	}
	public int getStar_dem() {
		return star_dem;
	}
	public void setStar_dem(int star_dem) {
		this.star_dem = star_dem;
	}
	public int getStar_mai() {
		return star_mai;
	}
	public void setStar_mai(int star_mai) {
		this.star_mai = star_mai;
	}
	public int getStar_dea() {
		return star_dea;
	}
	public void setStar_dea(int star_dea) {
		this.star_dea = star_dea;
	}
	public int getStar_ove() {
		return star_ove;
	}
	public void setStar_ove(int star_ove) {
		this.star_ove = star_ove;
	}
	public int getStu_grade() {
		return stu_grade;
	}
	public void setStu_grade(int stu_grade) {
		this.stu_grade = stu_grade;
	}
	public int getOnline_time() {
		return online_time;
	}
	public void setOnline_time(int online_time) {
		this.online_time = online_time;
	}
	public String getStu_pic() {
		return stu_pic;
	}
	public void setStu_pic(String stu_pic) {
		this.stu_pic = stu_pic;
	}
	
	@Override
	public String toString() {
		return "StudentInfo [stu_id=" + stu_id + ", stu_name=" + stu_name
				+ ", stu_pwd=" + stu_pwd + ", star_res=" + star_res
				+ ", star_dem=" + star_dem + ", star_mai=" + star_mai
				+ ", star_dea=" + star_dea + ", star_ove=" + star_ove
				+ ", stu_grade=" + stu_grade + ", online_time=" + online_time
				+ ", stu_pic=" + stu_pic + "]";
	}

	
	
}
