package com.bohechina.iotsystem.dao;

import com.bohechina.iotsystem.model.PollingRole;

public interface PollingRoleDao {

	public int count();

	public int updatePollingRole(PollingRole pollingRole);

	public int insertPollingRole(PollingRole pollingRole);

	public PollingRole getPollingRole();

}
