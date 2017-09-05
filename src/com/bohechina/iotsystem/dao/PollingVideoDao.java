package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.EnterpriseVideo;
import com.bohechina.iotsystem.model.PollingVideo;

public interface PollingVideoDao {

	public List<PollingVideo> getPollingVideoList(int type);

	public PollingVideo getPollingVideoById(int id);

	public int updatePollingVideo(PollingVideo pollingVideo);

	public int insertPollingVideo(PollingVideo pollingVideo);

	public int deletePollingVideo(Map<String, Object> map);

	public EnterpriseVideo getPollingVideoByType(int type);

	public int getCount(int type);

}
