<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="bh" uri="http://www.bohechina.com/tag-html" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
     <title>仪表工在线顶岗实训系统</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
        <link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>
	<style>
		.questionItem {color:black;display:block;height:100%;width:100%;}
		.questionItem:hover{color:red;background:none;}
		
		.tr:hover{background:#eee;}
		a{color:black;display:block;width:100%;height:100%;}
		a:hover{color:red;}
		
	</style>
  </head>
  
  <body>
        <div class="container">
        <div class="box_top" style="padding:5px;" ><b class="pl15">${title}</b></div>
        
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
								<tr>
									<th width="100">学习</th>
									<th width="100">训练</th>
									<th width="100">考核</th>
								</tr>
								<tr>
									<td class="td_center"><a href="${pageContext.request.contextPath}/Student/PollingDetail?action=1&type=${type}">操作间</a></td>
									<td class="td_center"><a href="${pageContext.request.contextPath}/Student/PollingDetail?action=2&type=${type}">操作间</a></td>
									<td class="td_center"><a href="${pageContext.request.contextPath}/Student/PollingDetail?action=3&type=${type}">操作间</a></td>									
								</tr>
								<tr>
									<td class="td_center"><a href="${pageContext.request.contextPath}/Student/PollingDetail?action=4&type=${type}">现场</a></td>
									<td class="td_center"><a href="${pageContext.request.contextPath}/Student/PollingDetail?action=5&type=${type}">现场</a></td>
									<td class="td_center"><a href="${pageContext.request.contextPath}/Student/PollingDetail?action=6&type=${type}">现场</a></td>
								</tr>
						</table>	
                </div>
                
    

        

    <script type="text/javascript">


        parent.window.setLocation("巡检训练 - ${title}");
    </script>
  </body>
</html>