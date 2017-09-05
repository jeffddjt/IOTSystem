package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.TestInfo;

public interface TestDao {

	public List<TestInfo> getTestInfoList(Map<String, String> map);

	public int addTestInfo(TestInfo testInfo);

	public int deleteTest(Map<String, Object> map);

	public TestInfo getTestInfoById(int id);

	public int updateTest(TestInfo testInfo);

}
