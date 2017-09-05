package com.bohechina.iotsystem.service;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.PollingRouteDao;
import com.bohechina.iotsystem.model.PollingRoute;

@Service("pollingRouteService")
public class PollingRouteService extends BaseService {

	public PollingRoute getPollingRoute() {
		PollingRouteDao pollingRouteDao=sqlSession.getMapper(PollingRouteDao.class);
		return pollingRouteDao.getPollingRoute();
	}

	public int updatePollingRoute(PollingRoute pollingRoute) {
		PollingRouteDao pollingRouteDao=sqlSession.getMapper(PollingRouteDao.class);
		if(pollingRouteDao.getCount()>0)
			return pollingRouteDao.updatePollingRoute(pollingRoute);
		else
			return pollingRouteDao.insertPollingRoute(pollingRoute);
	}


	
}
