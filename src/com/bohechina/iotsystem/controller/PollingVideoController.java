package com.bohechina.iotsystem.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bohechina.iotsystem.model.PollingVideo;
import com.bohechina.iotsystem.service.PollingVideoService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 视频管理Controller
 * @author jeffddjt
 *
 */
@Controller
public class PollingVideoController {
	
	@Resource(name="pollingVideoService")
	private PollingVideoService pollingVideoService;
	
	private String[] titles=new String[]{"仪表巡检视频管理","装置检修演示视频管理","安全演练视频演示"};
	private String[] titleStudent=new String[]{"仪表巡检视频演示","装置检修视频演示","安全演练视频演示"};

	/**
	 * 巡检视频管理页面Controller
	 * @param type
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/Teacher/PollingVideoManage")
	public String pollingVideoManage(int type,String pageNo,Model model){
		if(pageNo==null)
			pageNo="1";
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		List<PollingVideo> pollingVideoList=pollingVideoService.getPollingVideoList(type);
		int pageCount=page.getPages();
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("pollingVideoList",pollingVideoList);
		model.addAttribute("type",type);
		model.addAttribute("title",titles[type-1]);
		return "Teacher/Polling/PollingVideoManage";
	}
	
	/**
	 * 巡检视频浏览页面Controller
	 * @param type
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/Student/PollingVideoView")
	public String pollingVideoView(int type,String pageNo,Model model){
		if(pageNo==null)
			pageNo="1";
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		List<PollingVideo> pollingVideoList=pollingVideoService.getPollingVideoList(type);
		int pageCount=page.getPages();
		int no=(Integer.parseInt(pageNo)-1)*20+1;
		for(PollingVideo p : pollingVideoList){
			p.setNo(no++);
		}
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("pollingVideoList",pollingVideoList);
		model.addAttribute("type",type);
		model.addAttribute("title",titleStudent[type-1]);
		return "Student/Polling/PollingVideoView";
	}
	
	/**
	 * 巡检视频播放页面Controller
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/Student/PollingVideoPlay")
	public String pollingVideoPlay(int id,Model model){
		PollingVideo pollingVideo=pollingVideoService.getPollingVideoById(id);
		model.addAttribute("pollingVideo",pollingVideo);
		model.addAttribute("title",titleStudent[pollingVideo.getType()-1]);
		return "Student/Polling/PollingVideoPlayer";		
	}
	
	
	/**
	 * 巡检视频修改页面Controller
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Teacher/PollingVideoUpdate",method=RequestMethod.GET)
	public String pollingVideoUpdate(int id,Model model){
		PollingVideo pollingVideo=pollingVideoService.getPollingVideoById(id);
		if (pollingVideo==null)
			pollingVideo=new PollingVideo();
		model.addAttribute("pollingVideo",pollingVideo);
		model.addAttribute("title",titles[pollingVideo.getType()-1]);
		return "Teacher/Polling/PollingVideoUpdate";
	}
	
	/**
	 * 巡检视频修改动作Controller
	 * @param pollingVideo
	 * @return
	 */
	@RequestMapping(value="/Teacher/PollingVideoUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String pollingVideoUpdate(PollingVideo pollingVideo){
		int result=pollingVideoService.updatePollingVideo(pollingVideo);
		String str=result==0?"修改失败!":"Teacher/PollingVideoManage?type="+pollingVideo.getType();
		return result+"|"+str;
	}
	
	/**
	 * 巡检视频添加页面Controller
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Teacher/PollingVideoAdd",method=RequestMethod.GET)
	public String pollingVideoAdd(int type,Model model){
		PollingVideo pollingVideo=new PollingVideo();
		pollingVideo.setType(type);
		model.addAttribute("pollingVideo",pollingVideo);
		model.addAttribute("title",titles[type-1]);
		return "Teacher/Polling/PollingVideoAdd";
	}
	
	/**
	 * 巡检视频添加动作Controller
	 * @param pollingVideo
	 * @return
	 */
	@RequestMapping(value="/Teacher/PollingVideoAdd",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String pollingVideoAdd(PollingVideo pollingVideo){
		int result=pollingVideoService.insertPollingVideo(pollingVideo);
		String str=result==0?"添加视频失败!":"Teacher/PollingVideoManage?type="+pollingVideo.getType();
		return result+"|"+str;
	}
	
	/**
	 * 巡检视频删除动作Controller
	 * @param selected
	 * @return
	 */
	@RequestMapping(value="/Teacher/PollingVideoDelete",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String pollingVideoDelete(String selected){
		if(selected==null||selected.length()==0)
			return "0|请选择要删除的视频!";
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("ids", selected.split(","));
		int result=pollingVideoService.deletePollingVideo(map);
		if(result==0)
			return "0|视频删除失败!";
		return result+"|"+result+"个视频被删除!";
	}
	
	/**
	 * 巡检视频文件上传动作Controller
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/Teacher/PollingVideoManage/UpVideoFile", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upVideoFile(MultipartFile file, HttpServletRequest request) {
		if (file.getSize() == 0)
			return "0|请确定上传的文件不为空！";
		String path = request.getServletContext().getRealPath(
				"res/Polling/Video");
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
		return "1|上传成功!|res/Polling/Video/" + fileName;
	}
}
