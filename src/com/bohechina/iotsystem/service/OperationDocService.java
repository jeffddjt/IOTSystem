package com.bohechina.iotsystem.service;

import java.util.Date;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.OperationDocDao;
import com.bohechina.iotsystem.model.OperationDoc;

@Service("operationDocService")
public class OperationDocService extends BaseService {

	public OperationDoc getOperationDoc(){
		OperationDocDao operationDocDao=sqlSession.getMapper(OperationDocDao.class);
		return operationDocDao.getOperationDoc();
	}

	public int updateOperationDoc(OperationDoc operationDoc) {
			
		OperationDocDao operationDocDao=sqlSession.getMapper(OperationDocDao.class);
		if(operationDocDao.getCount()>0){
			operationDoc.setLastUpdateTime(new Date());
			return operationDocDao.updateOperationDoc(operationDoc);
		}
		else{
			operationDoc.setCreateTime(new Date());
			operationDoc.setLastUpdateTime(new Date());
			return operationDocDao.addOperationDoc(operationDoc);
		}
		
	}
	
}
