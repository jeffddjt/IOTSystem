package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.ResourceInfo;

public interface ResourceInfoDao {

	public int addResourceInfo(ResourceInfo resourceInfo);

	public int deleteResourceInfo(Map<String, Object> map);

	public int updateResourceInfo(ResourceInfo resourceInfo);

	public ResourceInfo getResourceInfoById(int id);

	public List<ResourceInfo> getResourceInfoListBySubject(String subject);

}
