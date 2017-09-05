package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.LoginUser;
import com.bohechina.iotsystem.model.StudentInfo;

public interface StudentInfoDao {

	public List<StudentInfo> getStudentInfoList();

	public int addStudentInfo(List<StudentInfo> studentInfoList);

	public int deleteStudentInfo(Map<String, Object> map);

	public StudentInfo getStudentInfoById(String stu_id);

	public StudentInfo verify(LoginUser loginUser);

	public int updateStudentInfo(StudentInfo studentInfo);

}
