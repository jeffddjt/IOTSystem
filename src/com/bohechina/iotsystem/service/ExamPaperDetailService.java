package com.bohechina.iotsystem.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.ExamPaperDetailDao;
import com.bohechina.iotsystem.model.ExamPaperDetail;

@Service("examPaperDetailService")
public class ExamPaperDetailService extends BaseService {

	public int getCountByExamId(int id) {
		ExamPaperDetailDao examPaperDetailDao=sqlSession.getMapper(ExamPaperDetailDao.class);
		return examPaperDetailDao.getCountByExamId(id);
	}

	public List<ExamPaperDetail> getExamPaperDetailList(int examId) {
		ExamPaperDetailDao examPaperDetailDao=sqlSession.getMapper(ExamPaperDetailDao.class);
		return examPaperDetailDao.getExamPaperDetailList(examId);
	}

	public ExamPaperDetail getExamPaperDetail(String examPaperId,
			String questionNo) {
		Map<String,String> map=new HashMap<String,String>();
		map.put("examPaperId", examPaperId);
		map.put("questionNo", questionNo);
		ExamPaperDetailDao examPaperDetailDao=sqlSession.getMapper(ExamPaperDetailDao.class);
		return examPaperDetailDao.getExamPaperDetail(map);
	}
	
	

	
}
