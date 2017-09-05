package com.bohechina.iotsystem.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.ExamDao;
import com.bohechina.iotsystem.dao.ExamPaperDao;
import com.bohechina.iotsystem.dao.ExamPaperDetailDao;
import com.bohechina.iotsystem.model.ExamInfo;
import com.bohechina.iotsystem.model.ExamPaper;
import com.bohechina.iotsystem.model.ExamPaperDetail;

@Service("examService")
public class ExamService extends BaseService {

	public List<ExamInfo> getExamInfoList(Map<String, String> map) {
		ExamDao examDao=sqlSession.getMapper(ExamDao.class);
		return examDao.getExamInfoList(map);
	}

	public int addExamInfo(ExamInfo examInfo) {
		ExamDao examDao=sqlSession.getMapper(ExamDao.class);
		examInfo.setCreateTime(new Date());
		examInfo.setLastUpdateTime(new Date());		
		return examDao.addExamInfo(examInfo);
	}

	public int deleteExam(Map<String, Object> map) {
		ExamDao examDao=sqlSession.getMapper(ExamDao.class);
		return examDao.deleteExam(map);
	}

	public ExamInfo getExamInfoById(int id) {
		ExamDao examDao=sqlSession.getMapper(ExamDao.class);
		return examDao.getExamInfoById(id);
	}

	public int updateExam(ExamInfo examInfo) {
		ExamDao examDao=sqlSession.getMapper(ExamDao.class);
		examInfo.setLastUpdateTime(new Date());
		return examDao.updateExam(examInfo);
	}

	public List<ExamInfo> getUnJoinedExam(String stu_id) {
		ExamDao examDao=sqlSession.getMapper(ExamDao.class);		
		return examDao.getUnJoinedExam(stu_id);
	}

	@SuppressWarnings("unchecked")
	public int generateExamPaper(Map<String, Object> paperMap) {
		ExamPaperDao examPaperDao=sqlSession.getMapper(ExamPaperDao.class);
		ExamPaper examPaper=(ExamPaper) paperMap.get("examPaper");
		examPaper.setStart_time(new Date());
		examPaperDao.insertExamPaper(examPaper);
		int examPaperId=examPaper.getId();
		List<ExamPaperDetail> epDetail=(List<ExamPaperDetail>) paperMap.get("examPaperDetail");
		for(int i=0;i<epDetail.size();i++){
			epDetail.get(i).setExamPaperID(examPaperId);
			epDetail.get(i).setQuestionNo(i+1);
		}
		ExamPaperDetailDao examPaperDetailDao=sqlSession.getMapper(ExamPaperDetailDao.class);
		examPaperDetailDao.insertExamPaperDetail(epDetail);
		return examPaperId;
	}

	public void deleteExamPaper(int id) {
		ExamPaperDao examPaperDao=sqlSession.getMapper(ExamPaperDao.class);
		examPaperDao.deleteExamPaper(id);
		
	}

	public List<ExamInfo> getUnJoinedExam(Map<String, String> map) {
		ExamDao examDao = sqlSession.getMapper(ExamDao.class);		
		return examDao.getUnJoinedExam(map);
	}

	public int updateExamPaper(ExamPaper examPaper) {
		ExamPaperDao examPaperDao=sqlSession.getMapper(ExamPaperDao.class);
		return examPaperDao.updateExamPaper(examPaper);
	}


}
