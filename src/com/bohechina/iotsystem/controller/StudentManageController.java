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

import com.bohechina.iotsystem.model.ExamPaperDetail;
import com.bohechina.iotsystem.model.ExamPaperView;
import com.bohechina.iotsystem.model.Question;
import com.bohechina.iotsystem.model.StudentInfo;
import com.bohechina.iotsystem.service.ExamPaperDetailService;
import com.bohechina.iotsystem.service.QuestionService;
import com.bohechina.iotsystem.service.StudentService;
import com.bohechina.iotsystem.utils.BHUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Controller
public class StudentManageController {

	@Resource(name = "studentService")
	private StudentService studentService;
	@Resource(name="examPaperDetailService")
	private ExamPaperDetailService examPaperDetailService;
	@Resource(name="questionService")
	private QuestionService questionService;

	@RequestMapping(value = "/Teacher/StudentInfo", method = RequestMethod.GET, produces = "text/html;charset=utf-8")
	public String studentManage(Model model,String pageNo) {
		if(pageNo==null)
			pageNo="1";
		int pageIndex=Integer.parseInt(pageNo);
		Page<?> page=PageHelper.startPage(pageIndex, 20);
		List<StudentInfo> studentInfoList = studentService.getStudentInfoList();
		int pageCount=page.getPages();
		model.addAttribute("StudentInfoList", studentInfoList);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("pageCount",pageCount);
		return "Teacher/StudentManage/StudentInfo";
	}

	@RequestMapping(value = "/Teacher/StudentInfoAdd", method = RequestMethod.GET, produces = "text/html;charset=utf-8")
	public String studentInfoAdd(Model model) {
		return "Teacher/StudentManage/StudentInfoAdd";
	}

	@RequestMapping(value = "/Teacher/StudentManage/UpExcelFile", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upExcelFile(MultipartFile file, HttpServletRequest request) {
		if (file == null || file.getSize() == 0)
			return "0|请选择要上传的文件!";
		String path = request.getServletContext().getRealPath(
				"res/Resource/files");
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
		return "1|上传成功!|res/Resource/files/" + fileName;

	}

	@RequestMapping(value="/Teacher/StudentInfoAdd",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public  String studentInfoAdd(String resVrp,HttpServletRequest request){
		String excelFile=request.getServletContext().getRealPath(resVrp);

		List<StudentInfo> studentInfoList=BHUtils.excelToStudentInfo(excelFile);
		File file=new File(excelFile);
		file.delete();
		if(studentInfoList==null||studentInfoList.size()==0)
			return "0|上传的文件格式有错误，请查证！";
		try{
		int result=studentService.addStudentInfo(studentInfoList);
		if(result==0){
			return "0|学生信息导入失败!";						
		}else{
			return result+"|Teacher/StudentInfo";
		}
		}catch(Exception e){
			return "0|学号存在冲突，请查证!";	
		}
	}

	@RequestMapping(value = "/Teacher/StudentInfoDelete", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String studentInfoDelete(String selected) {
		if (selected == null || selected.length() == 0)
			return "0|请选择要删除的学生!";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ids", selected.split(","));
		int result = studentService.deleteStudentInfo(map);
		return result + "|" + result + "条学生信息被删除!";
	}

	@RequestMapping(value="/Teacher/ScoreManage")
	public String scoreManage(String stu_id,Model model){
		StudentInfo studentInfo = studentService.getStudentInfoById(stu_id);
		List<ExamPaperView> examPaperViewList=studentService.getExamPaperList(stu_id);
		model.addAttribute("studentInfo",studentInfo);
		model.addAttribute("examPaperViewList",examPaperViewList);
		return "Teacher/StudentManage/ScoreManage";
	}
	
	@RequestMapping("/Teacher/ExamPaperBrowse")
	public String examPaperBrowse(int id,Model model){
		List<ExamPaperDetail> examPaperDetailList=examPaperDetailService.getExamPaperDetailList(id);
		for (ExamPaperDetail examPaperDetail : examPaperDetailList) {
			Question question=questionService.getQuestionById(examPaperDetail.getQuestionID());
			examPaperDetail.setQuestion(question);
		}
		model.addAttribute("examPaperDetailList",examPaperDetailList);
		return "Teacher/StudentManage/ExamPaperBrowse";
	}
	
	@RequestMapping(value="/Teacher/StudentUpdate", method=RequestMethod.GET,produces="text/html;charset=utf-8")
	public String updateStudent(String stu_id,Model model){
		StudentInfo studentInfo = studentService.getStudentInfoById(stu_id);
		model.addAttribute("studentInfo",studentInfo);
		return "Teacher/StudentManage/StudentUpdate";
	}
	
	@RequestMapping(value="/Teacher/StudentUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String updateStudent(StudentInfo studentInfo){
		int result = studentService.updateStudentInfo(studentInfo);
		if(result==0){
			return "0|学生信息修改失败!";
		}else{
			
			return result+"|Teacher/StudentInfo";
		}
	}
	
	
	@RequestMapping(value="/Teacher/StudentInfoManage/UpImgFile",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String uploadHeaderPic(MultipartFile file,HttpServletRequest request){
		if (file.getSize() == 0)
			return "0|请确定上传的图片不为空！";
		String path = request.getServletContext().getRealPath(
				"res/header/images");
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
		return "1|res/header/images/" + fileName;
	}
	
	
}
