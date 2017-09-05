package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.LoginUser;
import com.bohechina.iotsystem.model.TeacherInfo;

public interface TeacherInfoDao {

	public List<TeacherInfo> getTeacherInfoList();

	public int addTeacherInfo(TeacherInfo teacherInfo);

	public int deleteTeacherInfo(Map<String, Object> map);

	public TeacherInfo getTeacherInfoById(int id);

	public int updateTeacherInfo(TeacherInfo teacherInfo);

	public TeacherInfo verify(LoginUser loginUser);

	public int getTeacherInfoCount(TeacherInfo teacherInfo);

}
