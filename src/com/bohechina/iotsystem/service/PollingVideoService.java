package com.bohechina.iotsystem.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.PollingVideoDao;
import com.bohechina.iotsystem.model.PollingVideo;

@Service("pollingVideoService")
public class PollingVideoService extends BaseService {

	public List<PollingVideo> getPollingVideoList(int type) {
		PollingVideoDao pollingVideoDao=sqlSession.getMapper(PollingVideoDao.class);
		return pollingVideoDao.getPollingVideoList(type);
	}

	public PollingVideo getPollingVideoById(int id) {
		PollingVideoDao pollingVideoDao=sqlSession.getMapper(PollingVideoDao.class);
		return pollingVideoDao.getPollingVideoById(id);
	}

	public int updatePollingVideo(PollingVideo pollingVideo) {
		PollingVideoDao pollingVideoDao=sqlSession.getMapper(PollingVideoDao.class);
		return pollingVideoDao.updatePollingVideo(pollingVideo);
	}

	public int insertPollingVideo(PollingVideo pollingVideo) {
		PollingVideoDao pollingVideoDao=sqlSession.getMapper(PollingVideoDao.class);
		return pollingVideoDao.insertPollingVideo(pollingVideo);
	}

	public int deletePollingVideo(Map<String, Object> map) {
		PollingVideoDao pollingVideoDao=sqlSession.getMapper(PollingVideoDao.class);
		return pollingVideoDao.deletePollingVideo(map);
	}

}
