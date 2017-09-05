package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.TestPaperDetail;

public interface TestPaperDetailDao {

	public int updateTestPaperDetail(Map<String, Object> map);

	public void insertTestPaperDetail(List<TestPaperDetail> epDetail);

}
