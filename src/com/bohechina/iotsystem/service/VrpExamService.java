package com.bohechina.iotsystem.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.VrpExamInfoDao;
import com.bohechina.iotsystem.model.VrpExamInfo;

@Service("vrpExamService")
public class VrpExamService extends BaseService {

	public List<VrpExamInfo> GetVrpExamInfoList() {
		VrpExamInfoDao vrpExamInfoDao=sqlSession.getMapper(VrpExamInfoDao.class);
		return vrpExamInfoDao.GetVrpExamInfoList();
	}

	public VrpExamInfo GetVrpExamInfoById(String id) {
		VrpExamInfoDao vrpExamInfoDao=sqlSession.getMapper(VrpExamInfoDao.class);
		return vrpExamInfoDao.GetVrpExamInfoById(id);
	}

}
