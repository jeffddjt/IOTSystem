package com.bohechina.iotsystem.dao;

import com.bohechina.iotsystem.model.Polling;


public interface PollingDao {

	public Polling getPolling(String type);

	public int count(String type);

	public int updatePolling(Polling polling);

	public int insertPolling(Polling polling);
	
}
