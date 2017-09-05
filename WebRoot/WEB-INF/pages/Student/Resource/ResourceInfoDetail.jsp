<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
     <title>仪表工在线顶岗实训系统</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/validate.css"/>
          <link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/Validform_v5.3.2.js"></script>     
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>    
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>
    <script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>  

  </head>
  
  <body>
    <div class="container">
    <!-- 
    	<div class="box_top" style="padding:5px;" ><b class="pl15">${resourceInfo.resName}</b>
    	<input style="float:right;height:30px;"  type="button" name="button" class="btn btn82 btn_res"  value="返回" onclick="history.go(-1)"/>
    	</div>
    	-->
         <div class="box_center">
				<div style="min-width:1000px">
					<div style="width:800px;height:600px;float: left;" >
						<iframe frameborder="no" scrolling="no" width="100%"   src="${pageContext.request.contextPath}/${resourceInfo.resVrp}" style="width:800px;height:600px;border:none;"></iframe>
					</div>
					<div style="height:600px;margin-left:815px;">
						<div style="height:40px;line-height:40px;position:relative;"><b>功能描述：</b></div>
						<div style="line-height:30px;padding:5px;">${resourceInfo.resFun}</div>
						<div style="height:40px;line-height:40px;"><b>应用描述：</b></div>
						<div style="line-height:30px;padding:5px;">${resourceInfo.resApp}</div>
					</div>	
					<div style="clear:both;"></div>				
				</div>
         		
         </div>
      
     </div>
     <script type="text/javascript">
     	parent.window.setLocation("${subjectInfo.subject}--${resourceInfo.resName}")
     </script>
  </body>
</html>
