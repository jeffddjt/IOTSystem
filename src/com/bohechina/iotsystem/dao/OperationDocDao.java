package com.bohechina.iotsystem.dao;

import com.bohechina.iotsystem.model.OperationDoc;

public interface OperationDocDao {

	public int addOperationDoc(OperationDoc operationDoc);

	public int updateOperationDoc(OperationDoc operationDoc);

	public OperationDoc getOperationDoc();

	public int getCount();

}
