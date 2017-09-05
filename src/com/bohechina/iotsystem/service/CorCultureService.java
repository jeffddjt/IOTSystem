package com.bohechina.iotsystem.service;

import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Service;

import com.bohechina.iotsystem.dao.CorCultureDao;
import com.bohechina.iotsystem.model.CorCulture;

@Service("corCultureService")
public class CorCultureService extends BaseService {

	private List<CorCulture> getCorCultureList(){
		CorCultureDao corCultureDao=sqlSession.getMapper(CorCultureDao.class);
		return corCultureDao.getCorCultureList();
	}
	
   public CorCulture getCorCulture(){
	   List<CorCulture> list=getCorCultureList();
	   CorCulture corCulture;
	   if(list==null||list.isEmpty()){
		   corCulture=new CorCulture();
	   }else{
		   corCulture=list.get(0);
	   }
	   return corCulture;
   }

public int updateCorCulture(CorCulture corCulture) {
	CorCultureDao corCultureDao=sqlSession.getMapper(CorCultureDao.class);
	corCulture.setLastUpdateTime(new Date());
	int result=0;
	if(corCulture.getId()==0){
		corCulture.setCreateTime(new Date());
		result = corCultureDao.addCorCulture(corCulture);
	}else{
		result=corCultureDao.updateCorCulture(corCulture);
	}
	return result;
}


}
