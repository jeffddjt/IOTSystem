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
     <link rel="stylesheet" href="<%=path %>/assets/css/common.css"/>
     <link rel="stylesheet" href="<%=path %>/assets/css/main.css"/>
    <link rel="stylesheet" href="<%=path %>/assets/css/style.css"/>
        <link href="<%=path%>/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
     <script type="text/javascript" src="<%=path%>/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/assets/js/jquery.SuperSlide.js"></script>
     <script type="text/javascript" src="<%=path%>/assets/js/navSlide.js">  </script>
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
                    <input type="hidden" id="subject" name="subject" value="${subject}">
                    <input type="hidden" id="category" name="category" value="${category}">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>
                            <th > 资源名称 </th >
                        </tr>
                        <c:forEach items="${ResourceInfoList}" var="resourceInfo">
                        <tr class="tr" >
                            <td class="td_center">
                                  ${resourceInfo.no}
                            </td >                            
                            <td><a class="questionItem" href="<%=path%>/Student/ResourceInfoDetail?id=${resourceInfo.id}&subject=${subject}">${resourceInfo.resName}</a></td>

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


        parent.window.setLocation("${subjectInfo.subject}");
    </script>
  </body>
</html>