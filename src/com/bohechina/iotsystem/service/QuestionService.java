package com.bohechina.iotsystem.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.QuestionDao;
import com.bohechina.iotsystem.model.Question;

@Service("questionService")
public class QuestionService extends BaseService {

	public List<Question> getQuestionList(String subject){
		QuestionDao questionDao=sqlSession.getMapper(QuestionDao.class);
		return questionDao.getQuestionList(subject);
	}
	
	
	public Question getQuestionById(int id){
		QuestionDao questionDao=sqlSession.getMapper(QuestionDao.class);
		return questionDao.getQuestionById(id);
	}
	
	
	public int insertQuestion(Question question){
		QuestionDao questionDao=sqlSession.getMapper(QuestionDao.class);
		return questionDao.insertQuestion(question);
	}
	
	
	
	public int updateQuestion(Question question){
		QuestionDao questionDao=sqlSession.getMapper(QuestionDao.class);
		return questionDao.updateQuestion(question);
	}


	public int deleteQuestion(Map<String, Object> map) {
		QuestionDao questionDao=sqlSession.getMapper(QuestionDao.class);
		return questionDao.deleteQuestion(map);
	}

	}

