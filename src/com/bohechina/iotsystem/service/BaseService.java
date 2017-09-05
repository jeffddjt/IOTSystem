package com.bohechina.iotsystem.service;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;

public abstract class BaseService {

	@Resource(name="sqlSession")
	protected SqlSession sqlSession;



    
}
