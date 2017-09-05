package com.bohechina.iotsystem.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;




import com.bohechina.iotsystem.model.OperationDoc;
import com.bohechina.iotsystem.service.OperationDocService;

/**
 * 操作手册管理Controller
 * @author jeffddjt
 *
 */
@Controller
public class OperationDocController {

	@Resource(name="operationDocService")
	private OperationDocService operationDocService;
	
	/**
	 * 操作手册设置页面Controller
	 * @param model
	 * @return
	 */
	@RequestMapping("/Teacher/OperationDocSetting")
	public String OperationDocSetting(Model model){
		OperationDoc operationDoc=operationDocService.getOperationDoc();
		if(operationDoc==null){
			operationDoc=new OperationDoc();
			operationDoc.setCreateTime(new Date());
		}
		model.addAttribute("operationDoc", operationDoc);
		return "Teacher/baseInfo/OperationDocSetting";
	}
	
	
	/**
	 * 操作手册修改动作Controller
	 * @param operationDoc
	 * @return
	 */
	@RequestMapping(value="/Teacher/OperationDocUpdate",method=RequestMethod.POST,produces="text/html;charset=utf-8")
	@ResponseBody
	public String operationDocUpdate(OperationDoc operationDoc){
       int result=operationDocService.updateOperationDoc(operationDoc);      
       String str=result==0?"修改失败!":"Teacher/OperationDocSetting";
		return result+"|"+str;		
	}
	
	/**
	 * 操作手册上传Controller
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/Teacher/OperationDocSetting/UpFile", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String upVideoFile(MultipartFile file, HttpServletRequest request) {
		if (file.getSize() == 0)
			return "0|请确定上传的文件不为空！";
		String path = request.getServletContext().getRealPath(
				"res/Resource/OperationDoc");
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
		return "1|上传成功!|res/Resource/OperationDoc/" + fileName;
	}
	
	/**
	 * 操作手册预览页面Controller
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("OperationPreview")
	public void OperationPreview(HttpServletRequest request,HttpServletResponse response) throws IOException{
		OperationDoc operationDoc=operationDocService.getOperationDoc();
		if(operationDoc.getId()==0)
			return;
		File doc=new File(request.getServletContext().getRealPath(operationDoc.getFileName()));
		if(!doc.exists())
			return;
			
		response.setContentType("application/pdf");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		
		FileInputStream inputStream=new FileInputStream(doc);
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] buffer=new byte[(int) doc.length()];
		inputStream.read(buffer);
		sos.write(buffer,0,buffer.length);
		sos.close();
		sos.flush();
		inputStream.close();		
	}
}
