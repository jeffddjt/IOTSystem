package com.bohechina.iotsystem.service;

import java.util.Date;
import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.ProjectInfoDao;
import com.bohechina.iotsystem.model.ProjectInfo;

@Service("projectService")
public class ProjectService extends BaseService {

	public ProjectInfo getProjectInfo() {
		ProjectInfoDao projectInfoDao = sqlSession.getMapper(ProjectInfoDao.class);
		return  projectInfoDao.getProjectInfo();
	}

	public int updateProjectInfo(ProjectInfo projectInfo) {
		ProjectInfoDao projectInfoDao=sqlSession.getMapper(ProjectInfoDao.class);			
		projectInfo.setLastUpdateTime(new Date());
		if (projectInfoDao.getCount()>0){
			return projectInfoDao.updateProjectInfo(projectInfo);
		}else{
			projectInfo.setCreateTime(new Date());
			return projectInfoDao.addProjectInfo(projectInfo);
		}
		
	}
}
