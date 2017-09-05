package com.bohechina.iotsystem.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bohechina.iotsystem.model.PollingRoute;
import com.bohechina.iotsystem.service.PollingRouteService;

@Controller
public class PollingRouteController {
	
	@Resource(name="pollingRouteService")
	private PollingRouteService pollingRouteService;

	/**
	 * 巡检路线管理页面Controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/Teacher/PollingRouteManage")
	public String pollingRouteManage(Model model){
		PollingRoute pollingRoute=pollingRouteService.getPollingRoute();
		model.addAttribute("pollingRoute",pollingRoute);
		return "Teacher/Polling/PollingRouteManage";
	}
	
	/**
	 * 巡检路线更新动作Controller
	 * @param pollingRoute
	 * @return
	 */
	@RequestMapping(value="/Teacher/PollingRouteUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String pollingRouteUpdate(PollingRoute pollingRoute){
		int result=pollingRouteService.updatePollingRoute(pollingRoute);
		if(result==0)
			return "0|修改失败!";
		else
		return "1|Teacher/PollingRouteManage";
	}
	
	/**
	 * 巡检路线查看页面Controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/Student/PollingRouteView")
	public String pollingRouteView(Model model){
		PollingRoute pollingRoute=pollingRouteService.getPollingRoute();
		model.addAttribute("pollingRoute",pollingRoute);
		return "Student/Polling/PollingRouteView";
	}
	
	/**
	 * 巡检路线图上传动作Controller
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/Teacher/PollingRouteManage/UpImgFile",method=RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upImgFile(MultipartFile file,HttpServletRequest request){
		if (file.getSize() == 0)
			return "0|请确定上传的图片不为空！";
		String path = request.getServletContext().getRealPath(
				"res/Polling/images");
		String fileName = file.getOriginalFilename();
		String extName = fileName.substring(fileName.lastIndexOf("."),
				fileName.length());
		fileName = UUID.randomUUID().toString() + extName;
		File targetFile = new File(path, fileName);
		if (!targetFile.exists())
			targetFile.mkdirs();

		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
		}
		return "1|上传成功!|res/Polling/images/" + fileName;
	}
}
