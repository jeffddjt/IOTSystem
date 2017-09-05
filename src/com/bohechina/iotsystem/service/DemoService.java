package com.bohechina.iotsystem.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.DemoDao;
import com.bohechina.iotsystem.model.Demo;

@Service("demoService")
public class DemoService extends BaseService {
	
	public List<Demo> getDemoList(String subject){
		DemoDao demoDao=sqlSession.getMapper(DemoDao.class);
		return demoDao.getDemoList(subject);
	}

	public Demo getDemoById(String id) {
		DemoDao demoDao=sqlSession.getMapper(DemoDao.class);
		return demoDao.getDemoById(id);
	}

	public int updateDemo(Demo demo) {
		DemoDao demoDao=sqlSession.getMapper(DemoDao.class);
		return demoDao.updateDemo(demo);
	}

	public int addDemo(Demo demo) {
		DemoDao demoDao=sqlSession.getMapper(DemoDao.class);
		return demoDao.addDemo(demo);
	}

	public int deleteDemo(Map<String, Object> map) {
		DemoDao demoDao=sqlSession.getMapper(DemoDao.class);
		return demoDao.deleteDemo(map);
	}

	}

