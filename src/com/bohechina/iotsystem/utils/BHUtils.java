package com.bohechina.iotsystem.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import jxl.Sheet;
import jxl.Workbook;

import com.bohechina.iotsystem.model.StudentInfo;


public class BHUtils {

	private static final int buffer = 2048;

	public static String unZip(String zipFileStr) {

		String savePath = zipFileStr.substring(0, zipFileStr.lastIndexOf("."));
		String result="";

		try {
			BufferedOutputStream bos=null;
			ZipEntry entry=null;
			FileInputStream fis=new FileInputStream(zipFileStr);
			ZipInputStream zis=new ZipInputStream(new BufferedInputStream(fis));
			
			while((entry=zis.getNextEntry())!=null){
				
				byte[] buf=new byte[buffer];
				
				String fileName=entry.getName();				

				
				String extName=fileName.substring(fileName.lastIndexOf("."),fileName.length());
				if(extName.toLowerCase().equals(".htm")){
					result=fileName;
				}
				
				File saveFile=new File(savePath,fileName);
				if(!saveFile.getParentFile().exists())
					saveFile.getParentFile().mkdirs();
				
					
				
			FileOutputStream fos=new FileOutputStream(saveFile);
				bos=new BufferedOutputStream(fos);
				int count=-1;
				while((count=zis.read(buf,0,buffer))!=-1){
					bos.write(buf, 0, count);
				}
				bos.flush();
				bos.close();
			}
			zis.close();
		} catch (IOException e) {

			e.printStackTrace();
		}
		return result;
	}
	
	public static List<StudentInfo> excelToStudentInfo(String excelFile) {
		List<StudentInfo> studentInfoList = null;
		try {
			Workbook workBook=Workbook.getWorkbook(new File(excelFile));
			Sheet sheet=workBook.getSheet(0);
			int cols=sheet.getColumns();
			int rows=sheet.getRows();
			
			if(cols<3||rows<2)
				return null;
			if(!sheet.getCell(0,0).getContents().trim().equals("学号")||!sheet.getCell(1,0).getContents().trim().equals("姓名")||!sheet.getCell(2,0).getContents().trim().equals("密码"))
				return null;
			
			 studentInfoList=new ArrayList<StudentInfo>();
			for(int i=1;i<rows;i++){
					StudentInfo studentInfo=new StudentInfo();
					studentInfo.setStu_id(sheet.getCell(0,i).getContents());
					studentInfo.setStu_name(sheet.getCell(1, i).getContents());
					studentInfo.setStu_pwd(sheet.getCell(2,i).getContents());
					studentInfoList.add(studentInfo);
			}
				
		} catch (Exception e) {
			return null;
		}
		
		return studentInfoList ;
	}
	

}
