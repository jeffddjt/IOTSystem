package com.bohechina.iotsystem.dao;

import com.bohechina.iotsystem.model.PollingRoute;

public interface PollingRouteDao {

	public PollingRoute getPollingRoute();

	public int getCount();

	public int updatePollingRoute(PollingRoute pollingRoute);

	public int insertPollingRoute(PollingRoute pollingRoute);

}
