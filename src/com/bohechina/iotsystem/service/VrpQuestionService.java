package com.bohechina.iotsystem.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.VrpQuestionDao;
import com.bohechina.iotsystem.model.VrpQuestion;

@Service("vrpQuestionService")
public class VrpQuestionService extends BaseService {

	public List<VrpQuestion> GetVrpQuestionList(String subject){
		VrpQuestionDao vrpQuestionDao=sqlSession.getMapper(VrpQuestionDao.class);
		return vrpQuestionDao.GetVrpQuestionList(subject);
	}

	public VrpQuestion GetVrpQuestionById(int id) {
		VrpQuestionDao vrpQuestionDao=sqlSession.getMapper(VrpQuestionDao.class);
		return vrpQuestionDao.GetVrpQuestionById(id);
	}

	public int UpdateVrpQuestion(VrpQuestion question) {
		VrpQuestionDao vrpQuestionDao=sqlSession.getMapper(VrpQuestionDao.class);
		return vrpQuestionDao.UpdateVrpQuestion(question);
	}

	public int DeleteVrpQuestion(Map<String, Object> map) {
		VrpQuestionDao vrpQuestionDao=sqlSession.getMapper(VrpQuestionDao.class);
		return vrpQuestionDao.DeleteVrpQuestion(map);
	}

	public int AddVrpQuestion(VrpQuestion question) {
		VrpQuestionDao vrpQuestionDao=sqlSession.getMapper(VrpQuestionDao.class);
		return vrpQuestionDao.AddVrpQuestion(question);
	}
	
}
