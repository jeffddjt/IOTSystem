package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.Question;

public interface QuestionDao {
	
	public List<Question> getQuestionList(String subject);
	public Question getQuestionById(int id);
	public int insertQuestion(Question question);
	public int updateQuestion(Question question);
	public int deleteQuestion(Map<String, Object> map);
}
