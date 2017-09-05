package com.bohechina.iotsystem.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import com.bohechina.iotsystem.dao.TestDao;
import com.bohechina.iotsystem.dao.TestPaperDao;
import com.bohechina.iotsystem.dao.TestPaperDetailDao;
import com.bohechina.iotsystem.model.TestInfo;
import com.bohechina.iotsystem.model.TestPaper;
import com.bohechina.iotsystem.model.TestPaperDetail;

@Service("testService")
public class TestService extends BaseService {

	public List<TestInfo> getTestInfoList(Map<String, String> map) {
		TestDao testDao=sqlSession.getMapper(TestDao.class);
		return testDao.getTestInfoList(map);
	}

	public int addTestInfo(TestInfo testInfo) {
		TestDao testDao=sqlSession.getMapper(TestDao.class);
		testInfo.setCreateTime(new Date());
		testInfo.setLastUpdateTime(new Date());		
		return testDao.addTestInfo(testInfo);
	}

	public int deleteTest(Map<String, Object> map) {
		TestDao testDao=sqlSession.getMapper(TestDao.class);
		return testDao.deleteTest(map);
	}

	public TestInfo getTestInfoById(int id) {
		TestDao testDao=sqlSession.getMapper(TestDao.class);
		return testDao.getTestInfoById(id);
	}

	public int updateTest(TestInfo testInfo) {
		TestDao testDao=sqlSession.getMapper(TestDao.class);
		testInfo.setLastUpdateTime(new Date());
		return testDao.updateTest(testInfo);
	}

	public int generateTestPaper(Map<String, Object> paperMap) {
		TestPaperDao testPaperDao=sqlSession.getMapper(TestPaperDao.class);
		TestPaper testPaper=(TestPaper) paperMap.get("testPaper");
		testPaper.setStart_time(new Date());
		testPaperDao.insertTestPaper(testPaper);
		int testPaperId=testPaper.getId();
		@SuppressWarnings("unchecked")
		List<TestPaperDetail> epDetail=(List<TestPaperDetail>) paperMap.get("testPaperDetail");
		for(int i=0;i<epDetail.size();i++){
			epDetail.get(i).setTestPaperID(testPaperId);
			epDetail.get(i).setQuestionNo(i+1);
		}
		TestPaperDetailDao testPaperDetailDao=sqlSession.getMapper(TestPaperDetailDao.class);
		testPaperDetailDao.insertTestPaperDetail(epDetail);
		return testPaperId;
	}


}
