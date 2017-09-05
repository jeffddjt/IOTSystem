package com.bohechina.iotsystem.dao;

import java.util.List;
import java.util.Map;

import com.bohechina.iotsystem.model.NoticeInfo;

public interface NoticeInfoDao {

	public List<NoticeInfo> getNoticeInfoAll();

	public NoticeInfo getNoticeInfoById(int id);

	public int addNoticeInfo(NoticeInfo noticeInfo);

	public int deleteNoticeInfo(Map<String, Object> map);

	public int updateNoticeInfo(NoticeInfo noticeInfo);

}
