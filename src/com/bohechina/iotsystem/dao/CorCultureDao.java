package com.bohechina.iotsystem.dao;

import java.util.List;

import com.bohechina.iotsystem.model.CorCulture;

public interface CorCultureDao {

	public List<CorCulture> getCorCultureList();

	public int addCorCulture(CorCulture corCulture);

	public int updateCorCulture(CorCulture corCulture);

}
