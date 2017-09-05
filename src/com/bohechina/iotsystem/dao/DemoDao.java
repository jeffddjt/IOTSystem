package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.Demo;

public interface DemoDao {

	public List<Demo> getDemoList(String subject);

	public Demo getDemoById(String id);

	public int updateDemo(Demo demo);

	public int addDemo(Demo demo);

	public int deleteDemo(Map<String, Object> map);

}
