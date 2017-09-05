package com.bohechina.iotsystem.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.ExamPaperDao;
import com.bohechina.iotsystem.dao.ExamPaperDetailDao;
import com.bohechina.iotsystem.dao.StudentInfoDao;
import com.bohechina.iotsystem.dao.TestPaperDao;
import com.bohechina.iotsystem.dao.TestPaperDetailDao;
import com.bohechina.iotsystem.model.ExamPaper;
import com.bohechina.iotsystem.model.ExamPaperDetail;
import com.bohechina.iotsystem.model.ExamPaperView;
import com.bohechina.iotsystem.model.LoginUser;
import com.bohechina.iotsystem.model.StudentInfo;
import com.bohechina.iotsystem.model.TestPaper;

@Service("studentService")
public class StudentService extends BaseService {

	public List<StudentInfo> getStudentInfoList() {
		StudentInfoDao studentInfoDao=sqlSession.getMapper(StudentInfoDao.class);
		return studentInfoDao.getStudentInfoList();
	}

	public int addStudentInfo(List<StudentInfo> studentInfoList) {
		StudentInfoDao studentInfoDao=sqlSession.getMapper(StudentInfoDao.class);		
		return studentInfoDao.addStudentInfo(studentInfoList);
	}

	public int deleteStudentInfo(Map<String, Object> map) {
		StudentInfoDao studentInfoDao=sqlSession.getMapper(StudentInfoDao.class);
		return studentInfoDao.deleteStudentInfo(map);
	}

	public StudentInfo getStudentInfoById(String stu_id) {
		StudentInfoDao studentInfoDao = sqlSession.getMapper(StudentInfoDao.class);
		return studentInfoDao.getStudentInfoById(stu_id);
	}

	public List<ExamPaperView> getExamPaperList(String stu_id) {
		ExamPaperDao examPaperDao=sqlSession.getMapper(ExamPaperDao.class); 
		return examPaperDao.getExamPaperList(stu_id);
	}
	
    

	public StudentInfo verify(LoginUser loginUser) {
		StudentInfoDao studentInfoDao=sqlSession.getMapper(StudentInfoDao.class);		
		return studentInfoDao.verify(loginUser);
	}

/*	public int updateExamPaperDetail(String id, String questionNo, String answer1, String answer2) {
		ExamPaperDetailDao examPaperDetailDao=sqlSession.getMapper(ExamPaperDetailDao.class);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("questionNo", questionNo);
		map.put("answer1", answer1);
		map.put("answer2", answer2);
		return examPaperDetailDao.updateExamPaperDetail(map);
	}*/

	public ExamPaper getExamPaperById(int id) {
		ExamPaperDao examPaperDao=sqlSession.getMapper(ExamPaperDao.class);
		return examPaperDao.getExamPaperById(id);
	}

	public int calculateScore(int id) {
		ExamPaperDetailDao examPaperDetailDao=sqlSession.getMapper(ExamPaperDetailDao.class);
		return examPaperDetailDao.calculateScore(id);
	}

	public int updateStudentInfo(StudentInfo studentInfo) {
		StudentInfoDao studentInfoDao=sqlSession.getMapper(StudentInfoDao.class);		
		return studentInfoDao.updateStudentInfo(studentInfo);
	}

	public TestPaper getTestPaperById(int id) {
		TestPaperDao testPaperDao=sqlSession.getMapper(TestPaperDao.class);
		return testPaperDao.getTestPaperById(id);
	}


	public int updateTestPaperDetail(String id, String questionNo,	String stu_answer) {
		TestPaperDetailDao testPaperDetailDao=sqlSession.getMapper(TestPaperDetailDao.class);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("id", id);
		map.put("questionNo", questionNo);
		map.put("stu_answer", stu_answer);
		return testPaperDetailDao.updateTestPaperDetail(map);
		
	}


	public void updateExamPaperDetail(ExamPaperDetail examPaperDetail) {
		ExamPaperDetailDao examPaperDetailDao=sqlSession.getMapper(ExamPaperDetailDao.class);
		examPaperDetailDao.updateExamPaperDetail(examPaperDetail);
		
	}


}
