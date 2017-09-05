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
	</style>
  </head>
  
  <body>
        <div class="container">
        <div class="box_top" style="padding:5px;" ><b class="pl15">${demo.name}--工艺流程</b><input type="button" name="button" class="btn btn82 btn_res" style="float:right;" value="返回" onclick="history.go(-1)"/></div>
        
                <div style="min-width:1000px;" >
					<div style="width:400px;height:700px;float:left;overflow:auto;">${demo.flowText}</div>
					<div style="height:480px;">
						<a href="${pageContext.request.contextPath}/${demo.flow}" target="blank"><img width="600" height="400" src="${pageContext.request.contextPath}/${demo.flow}"></a>
					</div>
                </div> 

        
    </div>

    <script type="text/javascript">


        parent.window.setLocation("装置仿真演示 - ${demo.name}");
    </script>
  </body>
</html>