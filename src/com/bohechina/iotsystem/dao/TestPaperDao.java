package com.bohechina.iotsystem.dao;

import com.bohechina.iotsystem.model.TestPaper;

public interface TestPaperDao {

	public TestPaper getTestPaperById(int id);

	public void insertTestPaper(TestPaper testPaper);

}
