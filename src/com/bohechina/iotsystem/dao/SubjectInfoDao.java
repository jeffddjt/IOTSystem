package com.bohechina.iotsystem.dao;

import java.util.List;

import com.bohechina.iotsystem.model.SubjectInfo;

public interface SubjectInfoDao {

	public List<SubjectInfo> getSubjectList();

	public SubjectInfo getSubjectInfoById(String subject);

}
