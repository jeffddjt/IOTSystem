package com.bohechina.iotsystem.dao;

import java.util.List;

import com.bohechina.iotsystem.model.ExamPaper;
import com.bohechina.iotsystem.model.ExamPaperView;

public interface ExamPaperDao {

	public void insertExamPaper(ExamPaper examPaper);

	public void deleteExamPaper(int id);

	public List<ExamPaperView> getExamPaperList(String stu_id);

	public ExamPaper getExamPaperById(int id);

	public int updateExamPaper(ExamPaper examPaper);

}
