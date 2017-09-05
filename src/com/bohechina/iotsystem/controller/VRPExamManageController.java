package com.bohechina.iotsystem.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bohechina.iotsystem.model.VrpExamInfo;
import com.bohechina.iotsystem.service.VrpExamService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class VRPExamManageController {

	@Resource(name="vrpExamService")
	private VrpExamService vrpExamService;
	
	@RequestMapping("/Teacher/VrpExamManage")
	public String VrpExamManage(String pageNo,Model model){
		if(pageNo==null)
			pageNo="1";
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		List<VrpExamInfo> vrpExamInfoList=vrpExamService.GetVrpExamInfoList();
		model.addAttribute("vrpExamInfoList",vrpExamInfoList);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",page.getPages());
		return "Teacher/Exam/VrpExamManage";
	}
	
	
	@RequestMapping("/Teacher/VrpExamInfoUpdate")
	public String VrpExamInfoUpdate(String id,Model model){
		VrpExamInfo vrpExamInfo=vrpExamService.GetVrpExamInfoById(id);
		model.addAttribute("vrpExamInfo",vrpExamInfo);
		return "Teacher/Exam/VrpExamUpdate";
	}
}

