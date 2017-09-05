package com.bohechina.iotsystem.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.ResourceCategoryDao;
import com.bohechina.iotsystem.model.ResourceCategory;

@Service("resourceCategoryService")
public class ResourceCategoryService extends BaseService {

	public List<ResourceCategory> getResourceCategory(String subject){
		ResourceCategoryDao resourceCategoryDao=sqlSession.getMapper(ResourceCategoryDao.class);
		return resourceCategoryDao.getResourceCategory(subject);
	}
	
	public ResourceCategory getResourceCategoryById(int id){
		ResourceCategoryDao resourceCategoryDao=sqlSession.getMapper(ResourceCategoryDao.class);
		return resourceCategoryDao.getResourceCategoryById(id);
	}
}
