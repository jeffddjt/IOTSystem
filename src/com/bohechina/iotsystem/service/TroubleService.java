package com.bohechina.iotsystem.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.TroubleDao;
import com.bohechina.iotsystem.model.Trouble;

@Service("troubleService")
public class TroubleService extends BaseService {

	public List<Trouble> getTroubleList() {
		TroubleDao troubleDao=sqlSession.getMapper(TroubleDao.class);
		return troubleDao.getTroubleList();
	}

	public Trouble getTroubleById(int id) {
		TroubleDao troubleDao=sqlSession.getMapper(TroubleDao.class);
		return troubleDao.getTroubleById(id);
	}

	public int updateTrouble(Trouble trouble) {
		TroubleDao troubleDao=sqlSession.getMapper(TroubleDao.class);
		return troubleDao.updateTrouble(trouble);
	}

	public int insertTrouble(Trouble trouble) {
		TroubleDao troubleDao=sqlSession.getMapper(TroubleDao.class);
		return troubleDao.insertTrouble(trouble);
	}

	public int deleteTrouble(Map<String, Object> map) {
		TroubleDao troubleDao=sqlSession.getMapper(TroubleDao.class);
		return troubleDao.deleteTrouble(map);
	}


}
