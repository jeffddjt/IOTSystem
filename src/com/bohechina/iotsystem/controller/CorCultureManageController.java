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

import com.bohechina.iotsystem.model.CorCulture;
import com.bohechina.iotsystem.model.EnterpriseVideo;
import com.bohechina.iotsystem.model.Operation;
import com.bohechina.iotsystem.model.SubjectInfo;
import com.bohechina.iotsystem.service.CorCultureService;
import com.bohechina.iotsystem.service.EnterpriseVideoService;
import com.bohechina.iotsystem.service.OperationService;
import com.bohechina.iotsystem.service.SubjectInfoService;
import com.bohechina.iotsystem.utils.BHUtils;

/**
 * 企业文化管理Controller
 * @author jeffddjt
 *
 */
@Controller
public class CorCultureManageController {

	@Resource(name="corCultureService")
	private CorCultureService corCultureService;
	@Resource(name="enterpriseVideoService")
	private EnterpriseVideoService enterpriseVideoService;
	@Resource(name="operationService")
	private OperationService operationService;
	@Resource(name="subjectInfoService")
	private SubjectInfoService subjectInfoService;
	
	/**
	 * 企业文化管理页面Controller
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Teacher/CorCultureManage/ContentManage",method=RequestMethod.GET)
	public String contentManager(Model model){
		CorCulture corCulture=corCultureService.getCorCulture();
		model.addAttribute("corCulture", corCulture);
		return "Teacher/CorCultureManage/ContentManage";
	}
	
	/**
	 * 企业文化管理内容保存至数据库
	 * @param corCulture
	 * @return
	 */
	@RequestMapping(value="/Teacher/CorCultureManage/ContentManage",method=RequestMethod.POST)
	@ResponseBody
	public String contentManager(CorCulture corCulture ){		
		int result=corCultureService.updateCorCulture(corCulture);
		String str=result==0?"保存失败!":"/Teacher/CorCultureManage/ContentManage";		
		return result+"|"+str;
	}

	/**
	 * 学生登陆后企业文化页面Controller
	 * @param model
	 * @return
	 */
  @RequestMapping("/Student/CorCulture")
   public String corCultureContent(Model model){
	   CorCulture corCulture=corCultureService.getCorCulture();
	   model.addAttribute("content", corCulture.getContent());
	   return "Student/Content";
   }

  /**
   * 教师登陆后企业目视化管理页面Controller
   * @param model
   * @return
   */
  @RequestMapping("/Teacher/EnterpriseVideoManage")
  public String enterpriseVideoManage(Model model){
	  EnterpriseVideo  enterpriseVideo=enterpriseVideoService.getEnterpriseVideo();
	  if (enterpriseVideo==null)
		  enterpriseVideo=new EnterpriseVideo();
	  model.addAttribute("enterpriseVideo",enterpriseVideo);
	  model.addAttribute("title","企业目视化管理");
	  return "Teacher/CorCultureManage/EnterpriseVideoManage";
  }
  
  /**
   * 学生登陆后企业目视化展示页面Controller
   * @param model
   * @return
   */
  @RequestMapping("/Student/EnterpriseVideoView")
  public String enterpriseVideoView(Model model){
	  model.addAttribute("title","企业目视化展示");
	  EnterpriseVideo enterpriseVideo=enterpriseVideoService.getEnterpriseVideo();
	  model.addAttribute("url",enterpriseVideo.getPath());
	  return "Student/Trouble/VideoPlayer";
  }
  
  /**
   * 企业目视化视频更新
   * @param enterpriseVideo
   * @return
   */
  @RequestMapping(value="/Teacher/EnterpriseVideoUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
  @ResponseBody
  public String enterpriseVideoUpdate(EnterpriseVideo enterpriseVideo){
	  int result=enterpriseVideoService.updateEnterpriseVideo(enterpriseVideo);
	  String str=result==0?"更新失败!":"Teacher/EnterpriseVideoManage";
	  return result+"|"+str;
  }
  
  /**
   * 操作手册管理页面Controller
   * @param subject
   * @param model
   * @return
   */
  @RequestMapping(value="/Teacher/OperationManage")
  public String operationManage(String subject,Model model){
	  SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
	  Operation operation = operationService.getOperation(subject);
	  model.addAttribute("operation",operation);
	  model.addAttribute("subjectInfo",subjectInfo);
	  return "Teacher/CorCultureManage/OperationManage";
  }
  
  /**
   * 操作手册更新至数据库
   * @param operation
   * @return
   */
  @RequestMapping(value="/Teacher/OperationUpdate",produces="text/html;charset=utf-8")
  @ResponseBody
  public String operationUpdate(Operation operation){
	  int result=operationService.updateOperation(operation);
	  String str=result==0?"修改失败!":"Teacher/OperationManage?subject="+operation.getSubject();
	  return result+"|"+str;
  }
  
  /**
   * 学生操作测试页面Controller
   * @param subject
   * @param type
   * @param model
   * @return
   */
	@RequestMapping("/Student/TestOperation")
	public String testOperation(String subject,int type,Model model){
		Operation operation = operationService.getOperation(subject);
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
		String url="NoVrp";
		if(type==1)
			url=operation.getTestVrp();
		if(type==2)
			url=operation.getExamVrp();
	   model.addAttribute("url",url);
	   model.addAttribute("subjectInfo",subjectInfo);
	   return "Student/CorCulture/OperationTest";	   
	}
 

	/**
	 * 操作测试管理，更新VRP资源，上传VRP文件
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/Teacher/OperationManage/UpVrpFile", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upVRPFile(MultipartFile file, HttpServletRequest request) {
		if (file.getSize() == 0) {
			return "0|请确定上传的文件不为空！";
		}
		String path = request.getServletContext().getRealPath(
				"res/Operation/VRP");
		String fileName = file.getOriginalFilename();
//		String extName = fileName.substring(fileName.lastIndexOf("."),
//				fileName.length());
//		fileName = UUID.randomUUID().toString() + extName;
		File targetFile = new File(path, fileName);
		if (!targetFile.exists())
			targetFile.mkdirs();

		String resPath = "res/Operation/VRP/"
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
