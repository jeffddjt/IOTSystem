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

import com.bohechina.iotsystem.model.Question;
import com.bohechina.iotsystem.model.QuestionType;
import com.bohechina.iotsystem.model.SubjectInfo;
import com.bohechina.iotsystem.model.VrpQuestion;
import com.bohechina.iotsystem.service.QuestionService;
import com.bohechina.iotsystem.service.QuestionTypeService;
import com.bohechina.iotsystem.service.SubjectInfoService;
import com.bohechina.iotsystem.service.VrpQuestionService;
import com.bohechina.iotsystem.utils.BHUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class QuestionController {
	
	@Resource(name="questionService")
	private QuestionService questionService;
	
	@Resource(name="vrpQuestionService")
	private VrpQuestionService vrpQuestionService;
	
	@Resource(name="questionTypeService")
	private QuestionTypeService questionTypeService;
	@Resource(name="subjectInfoService")
	private SubjectInfoService subjectInfoService;
     
	@RequestMapping("/Teacher/QuestionManage")
	public String questionManage(String subject,String pageNo,Model model){
		if(pageNo==null)
			pageNo="1";
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		List<Question> questionList = questionService.getQuestionList(subject);
		int pageCount=page.getPages();
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("questionList",questionList);
		model.addAttribute("subject",subject);
		model.addAttribute("subjectInfo",subjectInfo);
		return "Teacher/Question/QuestionManage";
	}
	
	@RequestMapping(value="/Teacher/QuestionUpdate",method=RequestMethod.GET)
	public String questionUpdate(String id,String pageNo,Model model){
		if(id==null)
			return "Error/QuestionNotFound";
		Question question = questionService.getQuestionById(Integer.parseInt(id));
		List<QuestionType> questionTypeList=questionTypeService.getQuestionTypeList();
		List<SubjectInfo> subjectList=subjectInfoService.getSubjectList();
		model.addAttribute("question",question);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("questionTypeList",questionTypeList);
		model.addAttribute("subjectList",subjectList);
		return "Teacher/Question/QuestionUpdate";
	}
	
	@RequestMapping(value="/Teacher/QuestionUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String questionUpdate(Question question,String pageNo){
		int result=questionService.updateQuestion(question);
		if(result==0)
			return "0|修改失败!";
		else
			return result+"|Teacher/QuestionManage?subject="+question.getSubject()+"&pageNo="+pageNo;
	}
	
	@RequestMapping(value="/Teacher/QuestionManage/UpPhotoFile",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String upPhotoFile(MultipartFile file,HttpServletRequest request){
		if (file.getSize() == 0)
			return "0|请确定上传的图片不为空！";
		String path = request.getServletContext().getRealPath(
				"res/img");
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
		return "1|上传成功!|res/img/" + fileName;
	}
	
	/**
	 * VRP题库管理
	 * @param subject
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Teacher/VrpQuestionManage")
	public String VrpQuestionManage(String subject,String pageNo,Model model){
		if(pageNo==null)
			pageNo="1";
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		List<VrpQuestion> questionList = vrpQuestionService.GetVrpQuestionList(subject);
		int pageCount=page.getPages();
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("questionList",questionList);
		model.addAttribute("subject",subject);
		model.addAttribute("subjectInfo",subjectInfo);
		return "Teacher/Question/VrpQuestionManage";
	}
	/**
	 * VRP考题修改页面
	 * @param id
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Teacher/VrpQuestionUpdate",method=RequestMethod.GET)
	public String VrpQuestionUpdate(String id,String pageNo,Model model){
		if(id==null)
			return "Error/QuestionNotFound";
		VrpQuestion question=vrpQuestionService.GetVrpQuestionById(Integer.parseInt(id));
		List<QuestionType> questionTypeList=questionTypeService.getQuestionTypeList();
		List<SubjectInfo> subjectList=subjectInfoService.getSubjectList();
		model.addAttribute("question",question);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("questionTypeList",questionTypeList);
		model.addAttribute("subjectList",subjectList);
		return "Teacher/Question/VrpQuestionUpdate";
	}
	
	/**
	 * VRP考题修改动作
	 * @param question
	 * @param pageNo
	 * @return
	 */
	@RequestMapping(value="/Teacher/VrpQuestionUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String VrpQuestionUpdate(VrpQuestion question,String pageNo){
		int result=vrpQuestionService.UpdateVrpQuestion(question);
		if(result==0)
			return "0|修改失败!";
		else
			return result+"|Teacher/VrpQuestionManage?subject="+question.getSubject()+"&pageNo="+pageNo;
	}
	
	@RequestMapping(value="/Teacher/VrpQuestionDelete",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String VrpQuestionDelete(String Selected){
		if(Selected==null||Selected.length()==0)
			return "0|请选择要删除的题目!";
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("ids", Selected.split(","));
		int result=vrpQuestionService.DeleteVrpQuestion(map);
		if(result==0)
			return "0|题目删除失败!";
		return result+"|"+result+"个题目被删除!";
	}
	
	@RequestMapping(value="/Teacher/VrpQuestionAdd",method=RequestMethod.GET)
	public String VrpQuestionAdd(String subject,String type,Model model){
		if(type==null)
			type="1";
		VrpQuestion question=new VrpQuestion();
		question.setType(Integer.parseInt(type));
		question.setSubject(subject);
		model.addAttribute("question",question);
		return "Teacher/Question/VrpQuestionAdd";
		
	}
	
	
	@RequestMapping(value="/Teacher/VrpQuestionAdd",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String VrpQuestionAdd(VrpQuestion question){
		int result=vrpQuestionService.AddVrpQuestion(question);
		if(result==0)
			return "0|修改失败!";
		else
		{
			Page<?> page=PageHelper.startPage(1, 20);
			vrpQuestionService.GetVrpQuestionList(question.getSubject());
			int pageCount=page.getPages();
			return result+"|Teacher/VrpQuestionManage?subject="+question.getSubject()+"&pageNo="+pageCount;
		}
	}
	
	
	@RequestMapping(value = "/Teacher/QuestionManage/UpVrpFile", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upVRPFile(MultipartFile file, HttpServletRequest request) {
		if (file.getSize() == 0) {
			return "0|请确定上传的文件不为空！";
		}
		String path = request.getServletContext().getRealPath(
				"res/question/vrp");
		String fileName = file.getOriginalFilename();
//		String extName = fileName.substring(fileName.lastIndexOf("."),
//				fileName.length());
//		fileName = UUID.randomUUID().toString() + extName;
		File targetFile = new File(path, fileName);
		if (!targetFile.exists())
			targetFile.mkdirs();
		String resPath = "res/question/vrp/"
				+ fileName.substring(0, fileName.lastIndexOf("."));
		String res = "";
		try {
			file.transferTo(targetFile);
			res = resPath + "/" + BHUtils.unZip(path + "\\" + fileName);
		} catch (Exception e) {
		}
		return "1|上传成功!|" + res;
	}
	
	@RequestMapping(value="/Teacher/QuestionDelete",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String questionDelete(String Selected){
		if(Selected==null||Selected.length()==0)
			return "0|请选择要删除的题目!";
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("ids", Selected.split(","));
		int result=questionService.deleteQuestion(map);
		if(result==0)
			return "0|题目删除失败!";
		return result+"|"+result+"个题目被删除!";
	}
	
	@RequestMapping(value="/Teacher/QuestionAdd",method=RequestMethod.GET)
	public String questionAdd(String subject,String type,Model model){
		if(type==null)
			type="1";
		Question question=new Question();
		question.setType(Integer.parseInt(type));
		question.setSubject(subject);
		List<SubjectInfo> subjectList=subjectInfoService.getSubjectList();
		List<QuestionType> questionTypeList=questionTypeService.getQuestionTypeList();
		model.addAttribute("question",question);
		model.addAttribute("subjectList",subjectList);
		model.addAttribute("questionTypeList",questionTypeList);
		return "Teacher/Question/QuestionAdd";
	}
	
	@RequestMapping(value="/Teacher/QuestionAdd",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String questionAdd(Question question){
		int result=questionService.insertQuestion(question);
		if(result==0)
			return "0|修改失败!";
		else
		{
			Page<?> page=PageHelper.startPage(1, 20);
			//List<Question> questionList=questionService.getQuestionList(question.getSubject());
			int pageCount=page.getPages();
			return result+"|Teacher/QuestionManage?subject="+question.getSubject()+"&pageNo="+pageCount;
		}
	}
	
	@RequestMapping(value="/Student/GetQuestionAnswer",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String getQuestionAnswer(int id,int answer){
		Question question = questionService.getQuestionById(id);
		if(answer==1)
			return "1|"+question.getAnswer1();
		else if(answer==2)
				return "2|"+question.getAnswer2();
		return "0|无正确答案!";
	}
}
