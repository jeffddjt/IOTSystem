package com.bohechina.iotsystem.service;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.PollingRoleDao;
import com.bohechina.iotsystem.model.PollingRole;

@Service("pollingRoleService")
public class PollingRoleService extends BaseService {

	public int updatePollingRole(PollingRole pollingRole) {
		PollingRoleDao pollingRoleDao=sqlSession.getMapper(PollingRoleDao.class);
		if(pollingRoleDao.count()>0)
			return pollingRoleDao.updatePollingRole(pollingRole);
		else
			return pollingRoleDao.insertPollingRole(pollingRole);
	}

	public PollingRole getPollingRole() {
		PollingRoleDao pollingRoleDao=sqlSession.getMapper(PollingRoleDao.class);
		return pollingRoleDao.getPollingRole();
	}

}
