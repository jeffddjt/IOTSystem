package com.bohechina.iotsystem.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;




public class BHPager extends TagSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3130703253129548372L;
	private int pageNo;
	private int pageCount;
	private String pageSize;
	private String url;

	
	
	
	
	public int doStartTag() throws JspException{
		
		JspWriter out= this.pageContext.getOut();
		String tmpSize="";
		if(pageSize!=null){
			tmpSize="&pageSize="+pageSize;
		}
		StringBuffer sb=new StringBuffer();
        sb.append("<ul  >");
        if(pageNo>1){
        sb.append("<li ><a href=\""+url+"&pageNo=1"+tmpSize+"\">首页</a></li>");
        sb.append("<li ><a href=\""+url+"&pageNo="+(pageNo-1)+tmpSize+"\">上一页</a></li>");
        }
        sb.append("<li ><span>第"+pageNo+"页/共"+pageCount+"页</span></li>");
        if(pageNo<pageCount){
        sb.append("<li><a href=\""+url+"&pageNo="+(pageNo+1)+tmpSize+"\">下一页</a></li>");
        sb.append("<li ><a href=\""+url+"&pageNo="+pageCount+tmpSize+"\">末页</a></li>");
        }
        sb.append("</ul>");

		
		try {
			out.write(sb.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return super.doEndTag();
	}

	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}




	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getPageSize() {
		return pageSize;
	}


	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}


	
	
	
}
