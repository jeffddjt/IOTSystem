package com.bohechina.iotsystem.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bohechina.iotsystem.model.PollingRole;
import com.bohechina.iotsystem.service.PollingRoleService;

/**
 * 巡检规程Controller
 * @author jeffddjt
 *
 */
@Controller
public class PollingRoleController {

	@Resource(name="pollingRoleService")
	private PollingRoleService pollingRoleService;
	
	/**
	 * 巡检规程管理页面Controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/Teacher/PollingRoleManage")
	public String pollingRoleManage(Model model){
		PollingRole pollingRole=pollingRoleService.getPollingRole();
		model.addAttribute("pollingRole",pollingRole);
		return "Teacher/Polling/PollingRoleManage";
	}
	
	/**
	 * 巡检规程更新动作Controller
	 * @param pollingRole
	 * @return
	 */
	@RequestMapping(value="/Teacher/PollingRoleUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String pollingRoleUpdate(PollingRole pollingRole){
		int result=pollingRoleService.updatePollingRole(pollingRole);
		String str=result==0?"修改失败!":"Teacher/PollingRoleManage";
		return result+"|"+str;
	}
	
	/**
	 * 巡检规程浏览页面Controller
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping("/Student/PollingRoleView")
	public String pollingRoleView(String type,Model model){
		PollingRole pollingRole = pollingRoleService.getPollingRole();
		model.addAttribute("type",type);
		model.addAttribute("pollingRole",pollingRole);
		return "Student/Polling/PollingRoleView";
	}
}
