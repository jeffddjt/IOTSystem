package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.VrpQuestion;

public interface VrpQuestionDao {

	List<VrpQuestion> GetVrpQuestionList(String subject);

	VrpQuestion GetVrpQuestionById(int id);

	int UpdateVrpQuestion(VrpQuestion question);

	int DeleteVrpQuestion(Map<String, Object> map);

	int AddVrpQuestion(VrpQuestion question);
	
}
