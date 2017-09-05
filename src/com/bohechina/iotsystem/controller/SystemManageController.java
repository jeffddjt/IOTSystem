package com.bohechina.iotsystem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bohechina.iotsystem.model.TeacherInfo;
import com.bohechina.iotsystem.service.TeacherInfoService;

@Controller
public class SystemManageController {
	
	@Resource(name="teacherInfoService")
	private TeacherInfoService teacherInfoService;

	@RequestMapping("/Teacher/TeacherInfoManage")
	public String teacherInfoManage(Model model){
		List<TeacherInfo> teacherInfoList=teacherInfoService.getTeacherInfoList();
		model.addAttribute("TeacherInfoList",teacherInfoList);
		return "Teacher/System/TeacherInfoManage";
	}
	
	@RequestMapping(value="/Teacher/TeacherInfoAdd",method=RequestMethod.GET)
	public String teacherInfoAdd(){
		return "Teacher/System/TeacherInfoAdd";
	}
	
	@RequestMapping(value="/Teacher/TeacherInfoAdd",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String teacherInfoAdd(TeacherInfo teacherInfo){
		if(teacherInfoService.exists(teacherInfo))
			return "0|该账号名已存在!";
		
		int result=teacherInfoService.addTeacherInfo(teacherInfo);
		if(result==0)
			return "0|添加失败!";
		return result+"|Teacher/TeacherInfoManage";
	}
	
	@RequestMapping(value="/Teacher/TeacherInfoDelete",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String teacherInfoDelete(String selected){
		if(selected==null)
			return "0|请选择要删除的教师!";
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("ids", selected.split(","));
		int result=teacherInfoService.deleteTeacherInfo(map);
		if(result==0)
			return "0|删除失败!";
		return result+"|"+result+"位教师被删除！";
	}
	
	@RequestMapping(value="/Teacher/TeacherUpdate",method=RequestMethod.GET)
	public String teacherUpdate(int id,Model model){
		TeacherInfo teacherInfo=teacherInfoService.getTeacherInfoById(id);
		model.addAttribute("teacherInfo",teacherInfo);
		return "Teacher/System/TeacherUpdate";
	}
	
	@RequestMapping(value="/Teacher/TeacherUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String teacherUpdate(TeacherInfo teacherInfo){
		if(teacherInfoService.exists(teacherInfo))
			return "0|该账号名已存在!";
		int result=teacherInfoService.updateTeacherInfo(teacherInfo);
		if(result==0)
			return "0|修改失败!";
		return result+"|Teacher/TeacherInfoManage";
	}
}
