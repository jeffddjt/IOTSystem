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
import com.bohechina.iotsystem.model.Demo;
import com.bohechina.iotsystem.model.SubjectInfo;
import com.bohechina.iotsystem.service.DemoService;
import com.bohechina.iotsystem.service.SubjectInfoService;
import com.bohechina.iotsystem.utils.BHUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 视频演示Controller
 * @author jeffddjt
 *
 */
@Controller
public class DemoController {

	@Resource(name="subjectInfoService")
	private SubjectInfoService subjectInfoService;
	@Resource(name="demoService")
	private DemoService demoService;
	
	private String[] titles = new String[]{"工艺流程","概况","虚拟化工厂"};
	
	/**
	 * 视频演示管理
	 * @param subject
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/Teacher/DemoManage")
	public String demoManage(String subject,String pageNo,Model model){
		SubjectInfo subjectInfo = subjectInfoService.getSubjectInfoById(subject);
		if(pageNo==null)
			pageNo="1";
		Page<?> page = PageHelper.startPage(Integer.parseInt(pageNo),20);
		List<Demo> demoList = demoService.getDemoList(subject);
		int pageCount=page.getPages();
		model.addAttribute("subjectInfo",subjectInfo);
		model.addAttribute("demoList",demoList);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		return "Teacher/Demo/DemoManage";
	}
	
	/**
	 * 演示更新页面Controller
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Teacher/DemoUpdate",method=RequestMethod.GET)
	public String demoUpdate(String id,Model model){
		Demo demo=demoService.getDemoById(id);
		model.addAttribute("demo",demo);
		return "Teacher/Demo/DemoUpdate";
	}
	
	/**
	 * 演示更新动作Controller
	 * @param demo
	 * @return
	 */
	@RequestMapping(value="/Teacher/DemoUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String demoUpdate(Demo demo){
        int result=demoService.updateDemo(demo);
        if(result==0){
       	 return "0|资源修改失败！";
        }else{
       	 return result+"|Teacher/DemoManage?subject="+demo.getSubject();
        }		
	}
	
	/**
	 * 演示添加页面Controller
	 * @param subject
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Teacher/DemoAdd",method=RequestMethod.GET)
	public String demoAdd(String subject,Model model){
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
		Demo demo=new Demo();
		demo.setSubject(subject);
		demo.setVrp("NoVrp");
		model.addAttribute("demo",demo);
		model.addAttribute("subjectInfo",subjectInfo);
		return "Teacher/Demo/DemoAdd";
	}
	
	/**
	 * 演示添加动作
	 * @param demo
	 * @return
	 */
	@RequestMapping(value="/Teacher/DemoAdd",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String demoAdd(Demo demo){
		int result=demoService.addDemo(demo);
        if(result==0){
          	 return "0|资源添加失败！";
           }else{
          	 return result+"|Teacher/DemoManage?subject="+demo.getSubject();
           }		
	}
	
	/**
	 * 演示删除动作Controller
	 * @param selected
	 * @return
	 */
	@RequestMapping(value="/Teacher/DemoDelete",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String demoDelete(String selected){
		if(selected==null||selected.length()==0)
			return "0|请选择要删除的资源!";
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("ids", selected.split(","));
		int result=demoService.deleteDemo(map);
		if(result==0)
			return "0|资源删除失败!";
		return result+"|"+result+"个资源被删除!";
	}
	
	/**
	 * 视频演示浏览页面Controller
	 * @param subject
	 * @param pageNo
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping("/Student/DemoView")
	public String demoView(String subject,String pageNo,int type,Model model){
		if(pageNo==null)
			pageNo="1";
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		List<Demo> demoList=demoService.getDemoList(subject);
		int pageCount=page.getPages();
		int no=(Integer.parseInt(pageNo)-1)*20+1;
		for(Demo demo : demoList){
			demo.setNo(no++);
		}
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
		model.addAttribute("demoList",demoList);
		model.addAttribute("type",type);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("title",titles[type-1]);
		model.addAttribute("subjectInfo",subjectInfo);
		return "Student/Demo/DemoView";
	}
	
	/**
	 * 演示详情页面Controller
	 * @param id
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping("/Student/DemoDetail")
	public String demoDetail(String id,String type,Model model){
		Demo demo=demoService.getDemoById(id);
		model.addAttribute("demo",demo);
		return "Student/Demo/DemoDetail"+type;
	}
	
	/**
	 * 上传演示VRP文件动作Controller
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/Teacher/DemoManage/UpVrpFile", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upVRPFile(MultipartFile file, HttpServletRequest request) {
		if (file.getSize() == 0) {
			return "0|请确定上传的文件不为空！";
		}
		String path = request.getServletContext().getRealPath(
				"res/Demo/VRP");
		String fileName = file.getOriginalFilename();
//		String extName = fileName.substring(fileName.lastIndexOf("."),
//				fileName.length());
//		fileName = UUID.randomUUID().toString() + extName;
		File targetFile = new File(path, fileName);
		if (!targetFile.exists())
			targetFile.mkdirs();

		String resPath = "res/Demo/VRP/"
				+ fileName.substring(0, fileName.lastIndexOf("."));
		String res = "";
		try {
			file.transferTo(targetFile);
			res = resPath + "/" + BHUtils.unZip(path + "\\" + fileName);
		} catch (Exception e) {
		}
		return "1|上传成功!|" + res;
	}
	
	/**
	 * 上传演示图片文件Controller
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/Teacher/DemoManage/UpImgFile",method=RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upImgFile(MultipartFile file,HttpServletRequest request){
		if (file.getSize() == 0)
			return "0|请确定上传的图片不为空！";
		String path = request.getServletContext().getRealPath(
				"res/Demo/images");
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
		return "1|上传成功!|res/Demo/images/" + fileName;
	}
}
