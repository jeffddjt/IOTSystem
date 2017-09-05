package com.bohechina.iotsystem.dao;

import com.bohechina.iotsystem.model.Operation;

public interface OperationDao {

	public Operation getOperation(String subject);

	public int getCount(String subject);

	public int updateOperation(Operation operation);

	public int insertOperation(Operation operation);

}
