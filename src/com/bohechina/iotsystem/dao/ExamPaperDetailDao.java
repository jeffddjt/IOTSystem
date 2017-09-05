package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.ExamPaperDetail;

public interface ExamPaperDetailDao {

	public int getCountByExamId(int id);

	public void insertExamPaperDetail(List<ExamPaperDetail> epDetail);

	public int updateExamPaperDetail(ExamPaperDetail examPaperDetail);

	public List<ExamPaperDetail> getExamPaperDetailList(int examId);

	public int calculateScore(int id);

	public ExamPaperDetail getExamPaperDetail(Map<String, String> map);

}
