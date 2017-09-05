package com.bohechina.iotsystem.service;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.OperationDao;
import com.bohechina.iotsystem.model.Operation;

@Service("operationService")
public class OperationService extends BaseService {

	public Operation getOperation(String subject) {
		OperationDao operationDao=sqlSession.getMapper(OperationDao.class);
		return operationDao.getOperation(subject);
	}

	public int updateOperation(Operation operation) {
		OperationDao operationDao=sqlSession.getMapper(OperationDao.class);
		if(operationDao.getCount(operation.getSubject())>0)
			return operationDao.updateOperation(operation);
		else 
			return operationDao.insertOperation(operation);
	}
	
}
