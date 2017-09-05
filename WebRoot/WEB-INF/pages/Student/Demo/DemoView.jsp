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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css"/>
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
     
        
        <div id="table" class="mt10">
            <div class="box span10 oh">
                <div id="contentDiv" >
                <form id="resourceInfoForm">
                    <input type="hidden" id="subject" name="subject" value="${subjectInfo.id}">
                    <input type="hidden" id="category" name="type" value="${type}">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>
                            <th > 资源名称 </th >
                        </tr>
                        <c:forEach items="${demoList}" var="demo">
                        <tr class="tr" >
                            <td class="td_center">
                                  ${demo.no }
                            </td >                            
                            <td><a class="questionItem" href="${pageContext.request.contextPath}/Student/DemoDetail?id=${demo.id}&subject=${subjectInfo.id}&type=${type}">${demo.name}</a></td>

                        </tr>
                        </c:forEach>
                    </table>
                    </form>
                </div>
					
            </div>
               <div class="page mt10">
                    <div class="pagination">
							<bh:BHPager pageNo="${pageNo}" url="Student/ResourceInfoView?subject=${subject}&category=${category}" pageCount="${pageCount}"/>
                    </div>

                </div>
        </div>
    
        


        
    </div>

    <script type="text/javascript">


        parent.window.setLocation("${subjectInfo.subject}-${title}");
    </script>
  </body>
</html>