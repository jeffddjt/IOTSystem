<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="bh" uri="http://www.bohechina.com/tag-html" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/flowplayer/flowplayer-3.2.11.min.js"></script> 

  </head>
  
  <body style="height:100%;">
	<iframe id="ifr" width="100%" height="100%" scrolling="none" frameborder="0" ></iframe>

    <script type="text/javascript">
		
		var action=${action};
		var url="${pageContext.request.contextPath}/";
		if(action==2)
			url+="${polling.test_console}";
		if(action==3)
			url+="${polling.exam_console}";
		if(action==5)
			url+="${polling.test_scene}";
		if(action==6)
			url+="${polling.exam_scene}";
		$("#ifr").attr("src",url);
        parent.window.setLocation("${title} ");
    </script>
  </body>
</html>