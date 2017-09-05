package com.bohechina.iotsystem.service;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.PollingDao;
import com.bohechina.iotsystem.model.Polling;

@Service("pollingService")
public class PollingService extends BaseService {

	public Polling getPolling(String type) {
		PollingDao pollingDao=sqlSession.getMapper(PollingDao.class);
		return pollingDao.getPolling(type);
	}

	public int updatePolling(Polling polling) {
		PollingDao pollingDao=sqlSession.getMapper(PollingDao.class);
		if(pollingDao.count(polling.getType())>0)
			return pollingDao.updatePolling(polling);
		else
			return pollingDao.insertPolling(polling);
	}

	
}
