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

import com.bohechina.iotsystem.model.Trouble;
import com.bohechina.iotsystem.service.TroubleService;
import com.bohechina.iotsystem.utils.BHUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class TroubleController {

	@Resource(name="troubleService")
	private TroubleService troubleService;
	
	@RequestMapping("/Teacher/TroubleManage")
	public String troubleManage(String pageNo,Model model){
		if(pageNo==null)
			pageNo="1";
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		List<Trouble> troubleList=troubleService.getTroubleList();
		int pageCount=page.getPages();
		model.addAttribute("troubleList",troubleList);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		return "Teacher/Trouble/TroubleManage";
	}
	
	@RequestMapping("/Student/TroubleView")
	public String troubleView(String pageNo,Model model){
		if(pageNo==null)
			pageNo="1";
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		List<Trouble> troubleList=troubleService.getTroubleList();
		int pageCount=page.getPages();
		int no=(Integer.parseInt(pageNo)-1)*20+1;
		for(Trouble t : troubleList){
			t.setNo(no++);
		}
		model.addAttribute("troubleList",troubleList);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		return "Student/Trouble/TroubleView";
	}	
	
	@RequestMapping("/Student/TroubleStudy")
	public String troubleStudy(int id,int type,Model model){
		Trouble trouble=troubleService.getTroubleById(id);
		String url="NoVideo";
		String title="值班故障处理--"+trouble.getName()+"--";
		if(type==1){		
			url=trouble.getStudy_console();
			title+="操作间学习";
		}
		if(type==2){
			url=trouble.getStudy_scene();
			title+="现场学习";
		}
		model.addAttribute("url",url);
		model.addAttribute("title",title);
		return "Student/Trouble/VideoPlayer";
	}
	
	@RequestMapping("/Student/TroubleVrp")
	public String troubleVrp(int id,int type,Model model){
		Trouble trouble=troubleService.getTroubleById(id);
		String url="NoVideo";
		String title="值班故障处理--"+trouble.getName()+"--";
		if(type==1){		
			url=trouble.getTest_console();
			title+="操作间训练";
		}
		if(type==2){
			url=trouble.getTest_scene();
			title+="现场训练";
		}
		if(type==3){
			url=trouble.getExam_console();
			title+="操作间测试";
		}
		if(type==4){
			url=trouble.getExam_scene();
			title+="现场测试";
		}
		if(url==null||url.equals(""))
			url="NoVrp";
		model.addAttribute("url",url);
		model.addAttribute("title",title);
		return "Student/Trouble/VrpPlayer";
	}	
	
	@RequestMapping("/Student/TroubleRepairVrp")
	public String troubleRepairVrp(Model model){
		model.addAttribute("url","res/Trouble/Vrp/daxiu/daxiu.htm");
		model.addAttribute("title","检修准备虚拟工厂");
		return "Student/Trouble/VrpPlayer";
	}
	
	@RequestMapping(value="/Teacher/TroubleUpdate",method=RequestMethod.GET)
	public String troubleUpdate(int id,Model model){
		Trouble trouble=troubleService.getTroubleById(id);
		model.addAttribute("trouble",trouble);
		return "Teacher/Trouble/TroubleUpdate";
	}
	
	@RequestMapping(value="/Teacher/TroubleUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String troubleUpdate(Trouble trouble){
		int result=troubleService.updateTrouble(trouble);
		String str=result==0?"修改失败!":"Teacher/TroubleManage";
		return result+"|"+str;
	}
	
	@RequestMapping(value="/Teacher/TroubleAdd",method=RequestMethod.GET)
	public String troubleAdd(Model model){
		Trouble trouble=new Trouble();
		model.addAttribute("trouble",trouble);
		return "Teacher/Trouble/TroubleAdd";
	}
	@RequestMapping(value="/Teacher/TroubleAdd",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String troubleAdd(Trouble trouble){
		int result=troubleService.insertTrouble(trouble);
		String str=result==0?"添加失败!":"Teacher/TroubleManage";
		return result+"|"+str;
	}
	
	@RequestMapping(value="/Teacher/TroubleDelete",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String troubleDelete(String selected){
		if(selected==null)
			return "0|请选择要删除的故障信息!";
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("ids", selected.split(","));
		int result=troubleService.deleteTrouble(map);
		String str=result==0?"故障删除失败!":result+"条故障信息被删除!";
		return result+"|"+str;
	}
	
	@RequestMapping(value = "/Teacher/TroubleManage/UpVideoFile", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upVideoFile(MultipartFile file, HttpServletRequest request) {
		if (file.getSize() == 0)
			return "0|请确定上传的文件不为空！";
		String path = request.getServletContext().getRealPath(
				"res/Trouble/Video");
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
		return "1|上传成功!|res/Trouble/Video/" + fileName;
	}
	
	@RequestMapping(value = "/Teacher/TroubleManage/UpVrpFile", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upVRPFile(MultipartFile file, HttpServletRequest request) {
		if (file.getSize() == 0) {
			return "0|请确定上传的文件不为空！";
		}
		String path = request.getServletContext().getRealPath(
				"res/Trouble/Vrp");
		String fileName = file.getOriginalFilename();
//		String extName = fileName.substring(fileName.lastIndexOf("."),
//				fileName.length());
//		fileName = UUID.randomUUID().toString() + extName;
		File targetFile = new File(path, fileName);
		if (!targetFile.exists())
			targetFile.mkdirs();

		String resPath = "res/Trouble/Vrp/"
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
