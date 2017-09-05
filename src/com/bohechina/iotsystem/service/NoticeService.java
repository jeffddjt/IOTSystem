package com.bohechina.iotsystem.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.NoticeInfoDao;
import com.bohechina.iotsystem.model.NoticeInfo;

@Service("noticeService")
public class NoticeService extends BaseService {
	

   public List<NoticeInfo> GetNoticeInfoList(){
	   NoticeInfoDao noticeInfoDao=sqlSession.getMapper(NoticeInfoDao.class);
	   	   return noticeInfoDao.getNoticeInfoAll();
   }
   
   public NoticeInfo GetNoticeInfoById(int id){
	   NoticeInfoDao noticeInfoDao=sqlSession.getMapper(NoticeInfoDao.class);
	   return noticeInfoDao.getNoticeInfoById(id);
   }
   
   public int addNoticeInfo(NoticeInfo noticeInfo){
	   NoticeInfoDao noticeInfoDao=sqlSession.getMapper(NoticeInfoDao.class);
	   return noticeInfoDao.addNoticeInfo(noticeInfo);
   }

public int deleteNotice(Map<String, Object> map) {
	NoticeInfoDao noticeInfoDao=sqlSession.getMapper(NoticeInfoDao.class);
	return noticeInfoDao.deleteNoticeInfo(map);
}

public int updateNoticeInfo(NoticeInfo noticeInfo) {
	NoticeInfoDao noticeInfoDao=sqlSession.getMapper(NoticeInfoDao.class);
    return noticeInfoDao.updateNoticeInfo(noticeInfo);
	
}

	
}
