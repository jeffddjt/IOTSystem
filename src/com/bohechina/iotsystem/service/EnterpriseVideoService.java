package com.bohechina.iotsystem.service;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.PollingVideoDao;
import com.bohechina.iotsystem.model.EnterpriseVideo;

@Service("enterpriseVideoService")
public class EnterpriseVideoService extends BaseService {

	public EnterpriseVideo getEnterpriseVideo() {
		PollingVideoDao pollingVideoDao=sqlSession.getMapper(PollingVideoDao.class);
		return pollingVideoDao.getPollingVideoByType(9999);
	}

	public int updateEnterpriseVideo(EnterpriseVideo enterpriseVideo) {
		PollingVideoDao pollingVideoDao=sqlSession.getMapper(PollingVideoDao.class);
		if(pollingVideoDao.getCount(enterpriseVideo.getType())>0)
			return pollingVideoDao.updatePollingVideo(enterpriseVideo);
		else
			return pollingVideoDao.insertPollingVideo(enterpriseVideo);

	}

}
