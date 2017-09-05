package com.bohechina.iotsystem.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bohechina.iotsystem.model.Polling;
import com.bohechina.iotsystem.service.PollingService;
import com.bohechina.iotsystem.utils.BHUtils;

/**
 * 巡检管理Controller
 * @author jeffddjt
 *
 */
@Controller
public class PollingController {
	
	@Resource(name="pollingService")
	private PollingService pollingService;
		
	/**
	 * 巡检管理页面Controller
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping("/Teacher/PollingManage")
	public String pollingManage(String type,Model model){
		Polling polling=pollingService.getPolling(type);
		if(polling==null){
			polling=new Polling();
			polling.setType(type);
			polling.setStudy_console("NoVrp");
			polling.setStudy_scene("NoVrp");
			polling.setTest_console("NoVrp");
			polling.setTest_scene("NoVrp");
			polling.setExam_console("NoVrp");
			polling.setExam_scene("NoVrp");
			}
		String title = null;
		if(type.equals("1"))
			title="日巡检管理";
		if(type.equals("2"))
			title="月巡检管理";
		model.addAttribute("polling",polling);
		model.addAttribute("title",title);
		return "Teacher/Polling/PollingManage";
	}
	
	/**
	 * 巡检修改动作Controller
	 * @param polling
	 * @return
	 */
	@RequestMapping(value="/Teacher/PollingUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String pollingUpdate(Polling polling){
		int result=pollingService.updatePolling(polling);
		String str=result==0?"修改失败!":"Teacher/PollingManage?type="+polling.getType();
		return result+"|"+str;
	}
	
	/**
	 * 巡检展示页面controller
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping("/Student/PollingView")
	public String pollingView(String type,Model model){
		Polling polling=pollingService.getPolling(type);
		model.addAttribute("polling",polling);
		model.addAttribute("type",type);
		if(type.equals("1"))
			model.addAttribute("title","日巡检");
		if(type.equals("2"))
			model.addAttribute("title","月巡检");
		return "Student/Polling/PollingView";
	}
	
	/**
	 * 巡检内容展示页面Controller
	 * @param type
	 * @param action
	 * @param model
	 * @return
	 */
	@RequestMapping("/Student/PollingDetail")
	public String pollingDetail(String type,int action,Model model){
		String str="Student/Polling/PollingDetail";
		Polling polling=pollingService.getPolling(type);
		model.addAttribute("polling",polling);
		model.addAttribute("type",type);
		model.addAttribute("action",action);
		if(type.equals("1"))
			model.addAttribute("title","日巡检");
		if(type.equals("2"))
			model.addAttribute("title","月巡检");		
		if(action==1||action==4)
			str="Student/Polling/VideoPlayer";
		else{
				str="Student/Polling/VrpPlayer";
			}
		return str;
	}
	
	/**
	 *巡检VRP文件上传动作Controller 
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/Teacher/PollingManage/UpVrpFile", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upVRPFile(MultipartFile file, HttpServletRequest request) {
		if (file.getSize() == 0) {
			return "0|请确定上传的文件不为空！";
		}
		String path = request.getServletContext().getRealPath(
				"res/Polling/VRP");
		String fileName = file.getOriginalFilename();
//		String extName = fileName.substring(fileName.lastIndexOf("."),
//				fileName.length());
//		fileName = UUID.randomUUID().toString() + extName;
		File targetFile = new File(path, fileName);
		if (!targetFile.exists())
			targetFile.mkdirs();

		String resPath = "res/Polling/VRP/"
				+ fileName.substring(0, fileName.lastIndexOf("."));
		String res = "";
		try {
			file.transferTo(targetFile);
			res = resPath + "/" + BHUtils.unZip(path + "\\" + fileName);
		} catch (Exception e) {
		}
		return "1|上传成功!|" + res;
	}
}
