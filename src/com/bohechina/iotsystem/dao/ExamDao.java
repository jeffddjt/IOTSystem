package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.ExamInfo;

public interface ExamDao {

	public List<ExamInfo> getExamInfoList(Map<String, String> map);

	public int addExamInfo(ExamInfo examInfo);

	public int deleteExam(Map<String, Object> map);

	public ExamInfo getExamInfoById(int id);

	public int updateExam(ExamInfo examInfo);

	
	public List<ExamInfo> getUnJoinedExam(String stu_id);

	public List<ExamInfo> getUnJoinedExam(Map<String, String> map);

}
