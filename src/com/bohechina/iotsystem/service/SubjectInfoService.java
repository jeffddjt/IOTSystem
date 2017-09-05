package com.bohechina.iotsystem.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.SubjectInfoDao;
import com.bohechina.iotsystem.model.SubjectInfo;

@Service("subjectInfoService")
public class SubjectInfoService extends BaseService {

	public List<SubjectInfo> getSubjectList() {
		SubjectInfoDao subjectInfoDao=sqlSession.getMapper(SubjectInfoDao.class);
		return subjectInfoDao.getSubjectList();
	}

	public SubjectInfo getSubjectInfoById(String subject) {
		SubjectInfoDao subjectInfoDao=sqlSession.getMapper(SubjectInfoDao.class);
		return subjectInfoDao.getSubjectInfoById(subject);
	}

}
