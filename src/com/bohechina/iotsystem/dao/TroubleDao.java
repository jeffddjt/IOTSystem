package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.Trouble;

public interface TroubleDao {

	public List<Trouble> getTroubleList();

	public Trouble getTroubleById(int id);

	public int updateTrouble(Trouble trouble);

	public int insertTrouble(Trouble trouble);

	public int deleteTrouble(Map<String, Object> map);

}
