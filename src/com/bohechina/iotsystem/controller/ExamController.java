package com.bohechina.iotsystem.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bohechina.iotsystem.model.ExamInfo;
import com.bohechina.iotsystem.model.ExamPaper;
import com.bohechina.iotsystem.model.ExamPaperDetail;
import com.bohechina.iotsystem.model.Question;
import com.bohechina.iotsystem.model.StudentInfo;
import com.bohechina.iotsystem.model.SubjectInfo;
import com.bohechina.iotsystem.service.ExamPaperDetailService;
import com.bohechina.iotsystem.service.ExamService;
import com.bohechina.iotsystem.service.QuestionService;
import com.bohechina.iotsystem.service.StudentService;
import com.bohechina.iotsystem.service.SubjectInfoService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 考试管理Controller
 * @author jeffddjt
 *
 */
@Controller
public class ExamController {

	@Resource(name="examService")
	private ExamService examService;
	
	@Resource(name="examPaperDetailService")
	private ExamPaperDetailService examPaperDetailService;

	@Resource(name="studentService")
	private StudentService studentService;
	@Resource(name="subjectInfoService")
	private SubjectInfoService subjectInfoService;
	@Resource(name="questionService")
	private QuestionService questionService;
	
	/**
	 * 考试管理页面Controller
	 * @param model
	 * @param subject
	 * @param category
	 * @param pageNo
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="Teacher/ExamManage",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String examManage(Model model,String subject,String category,String pageNo) throws UnsupportedEncodingException{
		Map<String,String> map = new HashMap<String,String>();
		map.put("subject", subject);
		map.put("category",category);
		
		if(pageNo==null)
			pageNo="1";
		Page<?> page =PageHelper.startPage(Integer.parseInt(pageNo),20);		
		List<ExamInfo> examInfoList=examService.getExamInfoList(map);
		int pageCount=page.getPages();
		SubjectInfo subjectInfo = subjectInfoService.getSubjectInfoById(subject);
		model.addAttribute("subject", subject);
		model.addAttribute("subjectInfo",subjectInfo);
		model.addAttribute("category",category);
		model.addAttribute("ExamList",examInfoList);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		return "Teacher/Exam/ExamManage";
	}
	
	/**
	 * 发布考试页面Controller
	 * @param model
	 * @param subject
	 * @param category
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="Teacher/ExamAdd",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String examAdd(Model model,String subject,String category) throws UnsupportedEncodingException{	
		ExamInfo examInfo=new ExamInfo();
		examInfo.setSubject(subject);
		model.addAttribute("subject",subject);
		model.addAttribute("subjectInfo",subjectInfoService.getSubjectInfoById(subject));
		model.addAttribute("category",category);
		model.addAttribute("exam",examInfo);
		return "Teacher/Exam/ExamAdd";
	}
	
	/**
	 * 发布考试后台Action Controller
	 * @param examInfo
	 * @return
	 */
	@RequestMapping(value="Teacher/ExamAdd",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String examAdd(ExamInfo examInfo){
		int result = examService.addExamInfo(examInfo);
		if(result==0)
			return "0|添加失败！";
		else
		{
			return String.valueOf(result)+"|Teacher/ExamManage?subject="+examInfo.getSubject()+"&category="+examInfo.getCategory();
		}
	}
	
	/**
	 * 删除考试后台Action
	 * @param selected
	 * @return
	 */
	@RequestMapping(value="Teacher/ExamDelete",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String examDelete(String selected){
		if(selected==null)
			return "0|请选择要删除的考试!";
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("ids", selected.split(","));
		int result=examService.deleteExam(map);
		if (result == 0) {
			return "0|考试删除失败!";
		} else {
			
			return "1|"+result+"项考试删除成功!";
		}
	}
	
	/**
	 * 修改考试页面Controller
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="Teacher/ExamUpdate",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String examUpdate(int id,Model model){
		ExamInfo examInfo=examService.getExamInfoById(id);
		model.addAttribute("exam",examInfo);
		return "Teacher/Exam/ExamUpdate";
	}
	
	/**
	 * 修改考试后台Action
	 * @param examInfo
	 * @return
	 */
	@RequestMapping(value="Teacher/ExamUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String examUpdate(ExamInfo examInfo){
		int result=examService.updateExam(examInfo);
		if(result==0)
			return "0|修改失败！";
		else
		{
			return String.valueOf(result)+"|Teacher/ExamManage?subject="+examInfo.getSubject()+"&category="+examInfo.getCategory();
		}
	}
	
	/**
	 * 浏览未参加的考试Controller
	 * @param subject
	 * @param category
	 * @param pageNo
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/Student/UnJoinedExam",produces="text/html;charset=utf-8")
	public String unJoinExam(String subject,String category,String pageNo,Model model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(subject);
		StudentInfo student=(StudentInfo)session.getAttribute("user");
		String stu_id=student.getStu_id();
		
		Map<String,String> map=new HashMap<String, String>();
		map.put("stu_id", stu_id);
		map.put("subject", subject);
		map.put("category", category);
		if(pageNo==null){
			pageNo="1";
		}
		Page<?> page=PageHelper.startPage(Integer.parseInt(pageNo),20);		
		List<ExamInfo> examInfoList=examService.getUnJoinedExam(map);	
		int pageCount=page.getPages();
		for (ExamInfo examInfo : examInfoList) {
			examInfo.setSubject(subjectInfoService.getSubjectInfoById(examInfo.getSubject()).getSubject());
		}
		model.addAttribute("examInfoList",examInfoList);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("subject",subject);
		model.addAttribute("category",category);
		model.addAttribute("subjectInfo",subjectInfo);
		return "Student/BaseInfo/BrowseExam";
	}
	
	

	
	/**
	 * 开始考试页面Controller
	 * @param id
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/Student/StartExam",produces="text/html;charset=utf-8")
	@ResponseBody
	public String startExam(int id,Model model,HttpSession session,HttpServletRequest request){
			String agent=request.getHeader("User-Agent").toLowerCase();
			if(agent.indexOf("msie")<=0&&agent.indexOf("like gecko")<=0)
				return "0|本考试系统暂不支持非 Microsoft IE 浏览器,请使用 Microsoft IE 浏览器进行考试!";
			StudentInfo studentInfo=(StudentInfo)session.getAttribute("user");			
			ExamInfo examInfo=examService.getExamInfoById(id);
			ExamPaper examPaper=new ExamPaper();
			examPaper.setExamId(examInfo.getId());
			examPaper.setStu_id(studentInfo.getStu_id());			
			examPaper.setTotalScore(examInfo.getScore());
			List<Question> questionList=questionService.getQuestionList(examInfo.getSubject());
			List<ExamPaperDetail> examPaperDetail=new ArrayList<ExamPaperDetail>();
			generateExamPaper(questionList, examPaperDetail, examInfo.getQty(), examInfo.getCategory(),examInfo.getScore());			
			Map<String,Object> paperMap=new HashMap<String,Object>();
			paperMap.put("examPaper", examPaper);			
			paperMap.put("examPaperDetail", examPaperDetail);
			int result=examService.generateExamPaper(paperMap);
        	return "1|Student/StudentExam?id="+result;
	}
	
	/**
	 * 考卷页面Controller
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/Student/StudentExam",method=RequestMethod.GET)
	public String StudentExam(int id,Model model){ 
		ExamPaper examPaper=studentService.getExamPaperById(id);
		ExamInfo examInfo=examService.getExamInfoById(examPaper.getExamId());
		SubjectInfo subjectInfo=subjectInfoService.getSubjectInfoById(examInfo.getSubject());
		List<ExamPaperDetail> examPaperDetails=examPaperDetailService.getExamPaperDetailList(id);
		for (ExamPaperDetail examPaperDetail : examPaperDetails) {
			Question question=questionService.getQuestionById(examPaperDetail.getQuestionID());
			examPaperDetail.setQuestion(question);
		}
		model.addAttribute("examid",examInfo.getId());
		model.addAttribute("examName",examInfo.getExamName());
		model.addAttribute("examPaperId",examPaper.getId());
		model.addAttribute("timeOut",examInfo.getDuration());
		model.addAttribute("examPaperDetailList",examPaperDetails);
		model.addAttribute("subjectInfo",subjectInfo);
		return "Student/Exam/StudentExam";
	}
	
	
	/**
	 * 学生答题动作Controller
	 * @param examPaperId
	 * @param questionNo
	 * @param answer1
	 * @param answer2
	 */
	@RequestMapping("/Student/SetAnswer")
	@ResponseBody
	public void setAnswer(String examPaperId,String questionNo,String answer1,String answer2){
		//studentService.updateExamPaperDetail(examPaperId,questionNo,answer1,answer2);
		ExamPaperDetail examPaperDetail=examPaperDetailService.getExamPaperDetail(examPaperId,questionNo);
		double score=examPaperDetail.getScore();
		examPaperDetail.setStu_answer1(answer1);
		examPaperDetail.setStu_answer2(answer2);
		Question question=questionService.getQuestionById(examPaperDetail.getQuestionID());
		if(question.getType()!=3){
			if(examPaperDetail.getAnswer1().equals(examPaperDetail.getStu_answer1())){
				examPaperDetail.setStu_score(score);
			}else{
				examPaperDetail.setStu_score(0);
			}
		}else{
			if(examPaperDetail.getAnswer1().equals(examPaperDetail.getStu_answer1())&&examPaperDetail.getAnswer2().equals(examPaperDetail.getStu_answer2())){
				examPaperDetail.setStu_score(score);
			}else{
				if(examPaperDetail.getAnswer1().equals(examPaperDetail.getStu_answer1())||examPaperDetail.getAnswer2().equals(examPaperDetail.getStu_answer2())){
					examPaperDetail.setStu_score(score/2);
				}else{
					examPaperDetail.setStu_score(0);
				}
			}
		}
		studentService.updateExamPaperDetail(examPaperDetail);
		studentService.calculateScore(examPaperDetail.getExamPaperID());
		
	}
	
	/**
	 * 交卷页面Controller
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="Student/FinishExam",method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String finishExam(int id,Model model){
		studentService.calculateScore(id);
		ExamPaper examPaper=studentService.getExamPaperById(id);
		model.addAttribute("score",examPaper.getStu_score());
		return "Student/Exam/FinishExam";
	}
	
	
	/**
	 * 交卷动作后台Action
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/Student/FinishExam",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String finishExam(int id){
		ExamPaper examPaper=studentService.getExamPaperById(id);
		examPaper.setStop_time(new Date());
		examService.updateExamPaper(examPaper);
		return "1|"+examPaper.getStu_score();
	} 
	
/**
 * 生成试卷方法
 * @param source
 * @param target
 * @param count
 * @param category
 * @param score
 * @return
 */
	private double generateExamPaper(List<Question> source,List<ExamPaperDetail> target,int count,String category, int score){
		double result=0;
		double questionScore=score/count;
		if(source.size()<=count){
			questionScore=score/source.size();
			for(Question question : source){
				ExamPaperDetail detail=new ExamPaperDetail();
				detail.setQuestionSubject(question.getSubject());
				detail.setQuestionID(question.getId());
				detail.setQuestionCategory(category);
				detail.setAnswer1(question.getAnswer1());
				detail.setAnswer2(question.getAnswer2());				
				detail.setScore(questionScore);
				//detail.setAnswer(question.getAnswer());
				target.add(detail);
				result+=question.getScore();
			}
		}else{			
			Random random=new Random();
			List<Integer> rnd=new ArrayList<Integer>();
			while(rnd.size()<count){
				int index=random.nextInt(source.size());
				if(!rnd.contains(index)){
					rnd.add(index);
					Question question = source.get(index);
					ExamPaperDetail detail=new ExamPaperDetail();
					detail.setQuestionSubject(question.getSubject());
					detail.setQuestionID(question.getId());
					detail.setAnswer1(question.getAnswer1());
					detail.setAnswer2(question.getAnswer2());
					detail.setQuestionCategory(category);
					detail.setScore(questionScore);
					//detail.setAnswer(question.getAnswer());
					target.add(detail);			
					result+=question.getScore();
				}
			}
		}
		return result;
	}
	
}
