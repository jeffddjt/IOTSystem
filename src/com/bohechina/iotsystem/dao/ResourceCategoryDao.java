package com.bohechina.iotsystem.dao;

import java.util.List;

import com.bohechina.iotsystem.model.ResourceCategory;

public interface ResourceCategoryDao {

	public List<ResourceCategory> getResourceCategory(String subject);

	public ResourceCategory getResourceCategoryById(int id);

}
