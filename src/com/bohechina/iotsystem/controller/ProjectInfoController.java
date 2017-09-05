package com.bohechina.iotsystem.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bohechina.iotsystem.model.ProjectInfo;
import com.bohechina.iotsystem.service.ProjectService;

@Controller
public class ProjectInfoController {

	@Resource(name="projectService")
	private ProjectService projectService;
	
	@RequestMapping(value="/Teacher/ProjectIntroduceSetting")
	public String projectIntroduceSetting(Model model){
		ProjectInfo projectInfo=projectService.getProjectInfo();
		if (projectInfo==null)
			projectInfo=new ProjectInfo();
		model.addAttribute("projectInfo",projectInfo);
		return "Teacher/baseInfo/ProjectIntroduceSetting";
	}
	
	@RequestMapping(value="/Teacher/ProjectInfoUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String projectInfoUpdate(ProjectInfo projectInfo){
		int result=projectService.updateProjectInfo(projectInfo);
		String str=result==0?"保存失败！":"Teacher/ProjectIntroduceSetting";
		return result+"|"+str;
	}
	
	@RequestMapping("/Student/ProjectIntroduction")
	public String projectIntroduction(Model model){
		ProjectInfo projectInfo=projectService.getProjectInfo();
		model.addAttribute("projectInfo",projectInfo);
		return "Student/BaseInfo/ProjectIntroduction";
	}

}
