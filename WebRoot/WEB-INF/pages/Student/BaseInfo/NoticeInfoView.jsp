<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="bh"  uri="http://www.bohechina.com/tag-html"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css"/>
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>
	<style>
		.questionItem {color:black;display:block;height:100%;width:100%;}
		.questionItem:hover{color:red;background:none;}
		
		.tr:hover{background:#eee;}
		    a{color:#000;}
    a:hover{color:#f00;background:none;}
	</style>

  </head>
  
  <body>
    <div class="container">
    	<div id="table" class="mt10">
			<div class="box span10 oh">
				<div id="contentDiv">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
						<tr>
							<th width="30">#</th>
							<th>通知标题</th>
							<th width="150">创建时间</th>
							<th width="150">最后更新时间</th>
						</tr>
					    <c:forEach items="${noticeInfoList }" var="noticeInfo">
					    	<tr class="tr">
					    		<td>&nbsp;</td>
					    		<td ><a href="${pageContext.request.contextPath}/Student/NoticeInfoViewDetail?id=${noticeInfo.id}">${noticeInfo.title }</a></td>
					    		<td ><fmt:formatDate value="${noticeInfo.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					    		<td ><fmt:formatDate value="${noticeInfo.lastUpdateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
					    	</tr>
					    </c:forEach>
					</table>
				</div>
			</div>
		</div>
		                <div class="page mt10">
                    <div class="pagination">
							<bh:BHPager pageNo="${pageNo}" url="${pageContext.request.contextPath}/Student/NoticeInfoView?" pageCount="${pageCount }"/>
                    </div>

                </div>
    </div>
  </body>
</html>
