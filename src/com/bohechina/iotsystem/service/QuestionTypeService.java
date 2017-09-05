package com.bohechina.iotsystem.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.QuestionTypeDao;
import com.bohechina.iotsystem.model.QuestionType;

@Service("questionTypeService")
public class QuestionTypeService extends BaseService {

	public List<QuestionType> getQuestionTypeList() {
		QuestionTypeDao questionTypeDao=sqlSession.getMapper(QuestionTypeDao.class);
		return questionTypeDao.getQuestionTypeList();
	}

}
