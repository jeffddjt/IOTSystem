package com.bohechina.iotsystem.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bohechina.iotsystem.model.Question;
import com.bohechina.iotsystem.model.SubjectInfo;
import com.bohechina.iotsystem.model.TestInfo;
import com.bohechina.iotsystem.service.OperationService;
import com.bohechina.iotsystem.service.QuestionService;
import com.bohechina.iotsystem.service.StudentService;
import com.bohechina.iotsystem.service.SubjectInfoService;
import com.bohechina.iotsystem.service.TestService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class TestController {

	@Resource(name="testService")
	private TestService testService;

	@Resource(name="studentService")
	private StudentService studentService;
	
	@Resource(name="questionService")
	private QuestionService questionService;
	@Resource(name="subjectInfoService")
	private SubjectInfoService subjectInfoService;
	@Resource(name="operationService")
	private OperationService operationService;
	
	
	@RequestMapping(value="Teacher/TestManage",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String testManage(Model model,String subject,String category,String pageNo) throws UnsupportedEncodingException{
		//subject=new String(subject.getBytes("ISO8859-1"),"utf-8");
		//category=new String(category.getBytes("ISO8859-1"),"utf-8");
		Map<String,String> map = new HashMap<String,String>();
		map.put("subject", subject);
		map.put("category",category);
		if(pageNo==null)
			pageNo="1";
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);
		
		List<TestInfo> testInfoList=testService.getTestInfoList(map);
		int pageCount=page.getPages();
		model.addAttribute("subject", subject);
		model.addAttribute("category",category);
		model.addAttribute("TestList",testInfoList);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		return "Teacher/Test/TestManage";
	}
	
	@RequestMapping(value="Teacher/TestAdd",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String testAdd(Model model,String subject,String category) throws UnsupportedEncodingException{	
		//subject=new String(subject.getBytes("ISO8859-1"),"utf-8");
		//category=new String(category.getBytes("ISO8859-1"),"utf-8");
		model.addAttribute("subject",subject);
		model.addAttribute("category",category);
		return "Teacher/Test/TestAdd";
	}
	
	@RequestMapping(value="Teacher/TestAdd",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String testAdd(TestInfo testInfo){
		int result = testService.addTestInfo(testInfo);
		if(result==0)
			return "0|添加失败！";
		else
		{
			return String.valueOf(result)+"|Teacher/TestManage?subject="+testInfo.getSubject()+"&category="+testInfo.getCategory();
		}
	}
	
	@RequestMapping(value="Teacher/TestDelete",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String testDelete(String selected){
		if(selected==null)
			return "0|请选择要删除的考试!";
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("ids", selected.split(","));
		int result=testService.deleteTest(map);
		if (result == 0) {
			return "0|考试删除失败!";
		} else {
			
			return "1|"+result+"项考试删除成功!";
		}
	}
	
	@RequestMapping(value="Teacher/TestUpdate",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String testUpdate(int id,Model model){
		TestInfo testInfo=testService.getTestInfoById(id);
		model.addAttribute("test",testInfo);
		return "Teacher/Test/TestUpdate";
	}
	
	@RequestMapping(value="Teacher/TestUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String testUpdate(TestInfo testInfo){
		int result=testService.updateTest(testInfo);
		if(result==0)
			return "0|修改失败！";
		else
		{
			return String.valueOf(result)+"|Teacher/TestManage?subject="+testInfo.getSubject()+"&category="+testInfo.getCategory();
		}
	}
	
	@RequestMapping("/Student/Test")
	public String joinTest(String subject,String pageNo,Model model) throws UnsupportedEncodingException{
		if(pageNo==null)
			pageNo="1";
		Page<?> page = PageHelper.startPage(Integer.parseInt(pageNo),1);
		List<Question> questionList=questionService.getQuestionList(subject);
		int pageCount=page.getPages();
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
		model.addAttribute("questionList",questionList);
	    model.addAttribute("pageNo",pageNo);
	    model.addAttribute("pageCount",pageCount);
	    model.addAttribute("subjectInfo",subjectInfo);
		return "Student/BaseInfo/BrowseTest";
	}
	
	
	@RequestMapping(value="/Student/StartTest",produces="text/html;charset=utf-8")
	@ResponseBody
	public String startTest(int id,Model model,HttpServletRequest request){

        	return "1|Student/StudentTest";
	}
	

	
	@RequestMapping("/Student/SetTestAnswer")
	@ResponseBody
	public void setTestAnswer(String testid,String questionNo,String stu_answer){
		studentService.updateTestPaperDetail(testid,questionNo,stu_answer);

	}
	
}
