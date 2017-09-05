package com.bohechina.iotsystem.dao;

import java.util.List;

import com.bohechina.iotsystem.model.VrpExamInfo;

public interface VrpExamInfoDao {

	List<VrpExamInfo> GetVrpExamInfoList();

	VrpExamInfo GetVrpExamInfoById(String id);

}
