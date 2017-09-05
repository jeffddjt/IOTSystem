package com.bohechina.iotsystem.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
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

import com.bohechina.iotsystem.model.ResourceInfo;
import com.bohechina.iotsystem.model.SubjectInfo;
import com.bohechina.iotsystem.service.ResourceCategoryService;
import com.bohechina.iotsystem.service.ResourceInfoService;
import com.bohechina.iotsystem.service.SubjectInfoService;
import com.bohechina.iotsystem.utils.BHUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class ResourceController {

	@Resource(name="resourceInfoService")
	private ResourceInfoService resourceInfoService;
	
	@Resource(name="resourceCategoryService")
	private ResourceCategoryService resourceCategoryService;
	
	@Resource(name="subjectInfoService")
	private SubjectInfoService subjectInfoService;
	
	@RequestMapping(value="/Student/ResourceInfoView",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String resourceInfoView(String subject,String pageNo,Model model) throws UnsupportedEncodingException{
		if(pageNo==null)
			pageNo="1";
		
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		
		List<ResourceInfo> resourceInfoList=resourceInfoService.getResourceInfoListBySubject(subject);
		int pageCount = page.getPages();	
		int no=(Integer.parseInt(pageNo)-1)*20+1;
		for(ResourceInfo res : resourceInfoList){
			res.setNo(no++);
		}
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
		model.addAttribute("ResourceInfoList",resourceInfoList);
		model.addAttribute("subject",subject);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("subjectInfo",subjectInfo);
		return "Student/Resource/ResourceInfoView";
	}
	
	@RequestMapping("/Student/ResourceInfoDetail")
	public String resourceInfoDetail(int id,Model model){
		ResourceInfo resourceInfo=resourceInfoService.getResourceInfoById(id);
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(resourceInfo.getSubject());
		model.addAttribute("subjectInfo",subjectInfo);
		model.addAttribute("resourceInfo",resourceInfo);
		return "Student/Resource/ResourceInfoDetail";
	}
	
	@RequestMapping(value="/Teacher/ResourceInfoManage",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String resourceInfoManage(String subject,String pageNo,Model model) throws UnsupportedEncodingException{
		
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
		
		if(pageNo==null)
			pageNo="1";
		
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		List<ResourceInfo> resourceInfoList=resourceInfoService.getResourceInfoListBySubject(subject);
		int pageCount = page.getPages();	
		model.addAttribute("ResourceInfoList",resourceInfoList);
		model.addAttribute("subject",subject);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);	
		model.addAttribute("subjectInfo",subjectInfo);
		return "Teacher/Resource/ResourceInfoManage";
	}
	
	@RequestMapping(value="/Teacher/ResourceInfoAdd",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String resourceInfoAdd(String subject,Model model){
			SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
			ResourceInfo resourceInfo=new ResourceInfo();
			resourceInfo.setSubject(subject);
			resourceInfo.setResVrp("NoVrp");
			model.addAttribute("ResourceInfo",resourceInfo);
			model.addAttribute("subjectInfo",subjectInfo);
			model.addAttribute("subject",subject);			
			return "Teacher/Resource/ResourceInfoAdd";
	}
	
	
	@RequestMapping(value="/Teacher/ResourceInfoAdd",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String resourceInfoAdd(ResourceInfo resourceInfo,String subject){
		int result=resourceInfoService.addResourceInfo(resourceInfo);
		if(result==0)
			return "0|资源新增失败!";
		else
		{
			return result+"|Teacher/ResourceInfoManage?subject="+subject;
		}
		
	}
	
	@RequestMapping(value="/Teacher/ResourceInfoDelete",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String resourceInfoDelete(String selected){
		if(selected==null||selected.length()==0)
			return "0|请选择要删除的资源!";
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("ids", selected.split(","));
		int result=resourceInfoService.deleteResourceInfo(map);
		if(result==0)
			return "0|资源删除失败!";
		return result+"|"+result+"个资源被删除!";
	}
	
	@RequestMapping(value="/Teacher/ResourceInfoUpdate",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String resourceInfoUpdate(int id,Model model){
		ResourceInfo resourceInfo=resourceInfoService.getResourceInfoById(id);
        SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(resourceInfo.getSubject());		
		model.addAttribute("ResourceInfo",resourceInfo);
		model.addAttribute("subject",resourceInfo.getSubject());
		model.addAttribute("subjectInfo",subjectInfo);
		return "Teacher/Resource/ResourceInfoUpdate";
	}
	
	
	@RequestMapping(value="/Teacher/ResourceInfoUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String resourceInfoUpdate(ResourceInfo resourceInfo,String subject) throws UnsupportedEncodingException{
         int result=resourceInfoService.updateResourceInfo(resourceInfo);
         if(result==0){
        	 return "0|资源修改失败！";
         }else{
        	 return result+"|Teacher/ResourceInfoManage?subject="+subject;
         }
         
	}
	
	@RequestMapping(value="/Teacher/ResourceInfoManage/UpImgFile",method=RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upImgFile(MultipartFile file,HttpServletRequest request){
		if (file.getSize() == 0)
			return "0|请确定上传的图片不为空！";
		String path = request.getServletContext().getRealPath(
				"res/Resource/images");
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
		return "1|上传成功!|res/Resource/images/" + fileName;
	}
	
	
	
	@RequestMapping(value = "/Teacher/ResourceInfoManage/UpVrpFile", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upVRPFile(MultipartFile file, HttpServletRequest request) {
		if (file.getSize() == 0) {
			return "0|请确定上传的文件不为空！";
		}
		String path = request.getServletContext().getRealPath(
				"res/Resource/VRP");
		String fileName = file.getOriginalFilename();
//		String extName = fileName.substring(fileName.lastIndexOf("."),
//				fileName.length());
//		fileName = UUID.randomUUID().toString() + extName;
		File targetFile = new File(path, fileName);
		if (!targetFile.exists())
			targetFile.mkdirs();

		String resPath = "res/Resource/VRP/"
				+ fileName.substring(0, fileName.lastIndexOf("."));
		String res = "";
		try {
			file.transferTo(targetFile);
			res = resPath + "/" + BHUtils.unZip(path + "\\" + fileName);
		} catch (Exception e) {
		}
		return "1|上传成功!|" + res;
	}
	
	@RequestMapping(value="/NoVrp",produces="text/html;charset=utf-8")
	@ResponseBody
	public String NoVrp(){
		return "暂无资源!";
	}
}
