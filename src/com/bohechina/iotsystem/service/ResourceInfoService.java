package com.bohechina.iotsystem.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.ResourceInfoDao;
import com.bohechina.iotsystem.model.ResourceInfo;

@Service("resourceInfoService")
public class ResourceInfoService extends BaseService {


	public int addResourceInfo(ResourceInfo resourceInfo) {
		ResourceInfoDao resourceInfoDao=sqlSession.getMapper(ResourceInfoDao.class);
		return resourceInfoDao.addResourceInfo(resourceInfo);
	}

	public int deleteResourceInfo(Map<String, Object> map) {
		ResourceInfoDao resourceInfoDao=sqlSession.getMapper(ResourceInfoDao.class);
		return resourceInfoDao.deleteResourceInfo(map);
	}
	
   public int updateResourceInfo(ResourceInfo resourceInfo){
	   ResourceInfoDao resourceInfoDao=sqlSession.getMapper(ResourceInfoDao.class);
	   return resourceInfoDao.updateResourceInfo(resourceInfo);
   }

   public ResourceInfo getResourceInfoById(int id) {
	   ResourceInfoDao resourceInfoDao=sqlSession.getMapper(ResourceInfoDao.class);
	   return resourceInfoDao.getResourceInfoById(id);
   }

public List<ResourceInfo> getResourceInfoListBySubject(String subject) {
	ResourceInfoDao resourceInfoDao=sqlSession.getMapper(ResourceInfoDao.class);
	return resourceInfoDao.getResourceInfoListBySubject(subject);
}
		
	
}
