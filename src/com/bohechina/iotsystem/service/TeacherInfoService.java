package com.bohechina.iotsystem.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.TeacherInfoDao;
import com.bohechina.iotsystem.model.LoginUser;
import com.bohechina.iotsystem.model.TeacherInfo;

@Service("teacherInfoService")
public class TeacherInfoService extends BaseService{

	public List<TeacherInfo> getTeacherInfoList() {
		TeacherInfoDao teacherInfoDao=sqlSession.getMapper(TeacherInfoDao.class);
		return teacherInfoDao.getTeacherInfoList();
	}

	public int addTeacherInfo(TeacherInfo teacherInfo) {
		TeacherInfoDao teacherInfoDao=sqlSession.getMapper(TeacherInfoDao.class);
		return teacherInfoDao.addTeacherInfo(teacherInfo);
	}

	public int deleteTeacherInfo(Map<String, Object> map) {
		TeacherInfoDao teacherInfoDao = sqlSession.getMapper(TeacherInfoDao.class);
		return teacherInfoDao.deleteTeacherInfo(map);
	}

	public TeacherInfo getTeacherInfoById(int id) {
		TeacherInfoDao teacherInfoDao=sqlSession.getMapper(TeacherInfoDao.class);
		return teacherInfoDao.getTeacherInfoById(id);
	}

	public int updateTeacherInfo(TeacherInfo teacherInfo) {
		TeacherInfoDao teacherInfoDao=sqlSession.getMapper(TeacherInfoDao.class);
		return teacherInfoDao.updateTeacherInfo(teacherInfo);
	}

	public TeacherInfo verify(LoginUser loginUser) {
		TeacherInfoDao teacherInfoDao=sqlSession.getMapper(TeacherInfoDao.class);		
		return teacherInfoDao.verify(loginUser);
	}

	public boolean exists(TeacherInfo teacherInfo) {
		TeacherInfoDao teacherInfoDao=sqlSession.getMapper(TeacherInfoDao.class);
		return teacherInfoDao.getTeacherInfoCount(teacherInfo)>0;
	}
	
}
