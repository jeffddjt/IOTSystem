package com.bohechina.iotsystem.dao;

import com.bohechina.iotsystem.model.ProjectInfo;

public interface ProjectInfoDao {

	public ProjectInfo getProjectInfo();

	public int addProjectInfo(ProjectInfo projectInfo);

	public int updateProjectInfo(ProjectInfo projectInfo);

	public int getCount();


}
