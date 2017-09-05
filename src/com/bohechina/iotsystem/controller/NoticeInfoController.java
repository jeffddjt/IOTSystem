package com.bohechina.iotsystem.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bohechina.iotsystem.model.NoticeInfo;
import com.bohechina.iotsystem.service.NoticeService;
import com.bohechina.iotsystem.utils.EscapeUnescape;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 通知管理Controller
 * @author jeffddjt
 *
 */
@Controller
public class NoticeInfoController {

	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	
	/**
	 * 通知管理页面Controller
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/Teacher/NoticeInfoManage")
	public String NoticeInfoManage(String pageNo,Model model){
		if(pageNo==null)
			pageNo="1";
		
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		
		model.addAttribute("NoticeInfoList", noticeService.GetNoticeInfoList());
		int pageCount=page.getPages();
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		return "Teacher/baseInfo/NoticeInfoManage";
	}  
	
	/**
	 * 通知添加页面Controller
	 * @param mode
	 * @return
	 */
	@RequestMapping(value="/Teacher/NoticeInfoAdd",method=RequestMethod.GET)
	public String NoticeInfoAdd(Model mode){
		return "Teacher/baseInfo/NoticeInfoAdd";
	}
	
	/**
	 * 通知添加动作Controller
	 * @param noticeInfo
	 * @return
	 */
	@RequestMapping(value="/Teacher/NoticeInfoAdd",produces="text/html;charset=utf-8",method=RequestMethod.POST)
	@ResponseBody
	public String NoticeInfoAdd(NoticeInfo noticeInfo){
		noticeInfo.setCreateTime(new Date());
		noticeInfo.setLastUpdateTime(new Date());
		noticeInfo.setStatus(true);
		int result=noticeService.addNoticeInfo(noticeInfo);
		String str=result==0?"保存失败!":"Teacher/NoticeInfoManage";		
		return result+"|"+str;
	}
	
	/**
	 * 通知删除动作Controller
	 * @param selected
	 * @return
	 */
	@RequestMapping(value="/Teacher/NoticeInfoDelete",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String NoticeInfoDelete(String selected){
		if(selected==null)
			return "0|请选择要删除的通知！";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("ids", selected.split(","));
		int result=noticeService.deleteNotice(map);
		String str=result==0?"删除失败!":result+"条通知被删除!";
		return result+"|"+str;
	}
	
	/**
	 * 通知修改页面Controller
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Teacher/NoticeInfoUpdate",method=RequestMethod.GET)
	public String NoticeInfoUpdate(int id,Model model){
		NoticeInfo noticeInfo=noticeService.GetNoticeInfoById(id);
		model.addAttribute("noticeInfo",noticeInfo );
		return "Teacher/baseInfo/NoticeInfoUpdate";
	}
	
	/**
	 * 通知修改动作Controller
	 * @param noticeInfo
	 * @return
	 */
	@RequestMapping(value="/Teacher/NoticeInfoUpdate",method=RequestMethod.POST)
	@ResponseBody
	public String NoticeInfoUpdate(NoticeInfo noticeInfo){
		noticeInfo.setLastUpdateTime(new Date());
		int result=noticeService.updateNoticeInfo(noticeInfo);
		String str=result==0?"保存失败!":"Teacher/NoticeInfoManage";		
		return result+"|"+str;
	}
	
	/**
	 * 通知列表浏览页面Controller
	 * @param model
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("/Student/NoticeInfoView")
	public String NoticeInfoView(Model model,String pageNo){
		if(pageNo==null){
			pageNo="1";
		}
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);		
		List<NoticeInfo> noticeInfoList=noticeService.GetNoticeInfoList();
		int pageCount=page.getPages();
		model.addAttribute("noticeInfoList",noticeInfoList);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		return "Student/BaseInfo/NoticeInfoView";
	}
	
	/**
	 * 通知内容浏览页面Controller
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/Student/NoticeInfoViewDetail")
	public String NoticeInfoViewDetail(int id,Model model){
		NoticeInfo noticeInfo=noticeService.GetNoticeInfoById(id);
		noticeInfo.setContent(EscapeUnescape.unescape(noticeInfo.getContent()));
		model.addAttribute("noticeInfo",noticeInfo);
		return "Student/BaseInfo/NoticeInfoViewDetail";
	}
}
