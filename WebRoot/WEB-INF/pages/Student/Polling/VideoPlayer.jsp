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
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/flowplayer/flowplayer-3.2.11.min.js"></script> 
	<style>
		.questionItem {color:black;display:block;height:100%;width:100%;}
		.questionItem:hover{color:red;background:none;}
		
		.tr:hover{background:#eee;}
		a{color:black;display:block;width:100%;height:100%;}
		a:hover{color:red;}
				#player {width:800px;height:600px;position: absolute;left: 50%;top:50%;
					margin-left: -400px;margin-top: -300px;
		}
	</style>
  </head>
  
  <body>
        <div class="container">
        <div class="box_top" style="padding:5px;" ><b class="pl15">${title}</b></div>
        			<div id="player" ></div>
                </div>
                


        

    <script type="text/javascript">
		
		var action='${action}';
		var url="${pageContext.request.contextPath}/";
		if(action=="1")
			url+="${polling.study_console}";
		else 
			url+="${polling.study_scene}";
		
		 setPlayer(url);
		function setPlayer(urlpath){
			flowplayer("player", "${pageContext.request.contextPath}/assets/js/flowplayer/flowplayer-3.2.12.swf", { clip: { url: urlpath, autoPlay: true, autoBuffering: true} });
		}
        parent.window.setLocation("${title} - 学习");
    </script>
  </body>
</html>