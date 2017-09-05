<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
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
		p {width:500px;overflow:hidden;word-break:keep-all;white-space:nowrap;text-overflow:ellipsis;}
	</style>
  </head>
  
  <body>
        <div class="container">
        <div id="button" class="mt10">
            <input type="button" name="button" class="btn btn82 btn_add" value="新增"  onclick="window.location.href = '${pageContext.request.contextPath}/Teacher/VrpExamInfoAdd?subject=${subject}'" />
            <input type="button" name="button" class="btn btn82 btn_del" value="删除"  onclick="deleteQuestion()"/>
            <input type="button" name="button" class="btn btn82 btn_checked" value="全选" onclick="SelectAll()"/>
            <input type="button" name="button" class="btn btn82 btn_nochecked" value="取消" onclick="UnSelectAll()"/>
        </div>

        <div id="table" class="mt10">
            <div class="box span10 oh">
                <div id="contentDiv" >
                <form id="questionForm">
                    <input type="hidden" id="subject" name="subject" value="${subject}">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>
                            <th > 考试名称 </th >
                            <th width="100">题目数量</th>
                            <th width="100">开始时间</th>
                            <th width="100">结束时间</th>

                        </tr>
                        <c:forEach items="${vrpExamInfoList}" var="vrpExamInfo">
                        <tr class="tr" >
                            <td class="td_center">
                                <input type = "checkbox" name="Selected" value="${question.id}">
                            </td >
                            <td ><a class="questionItem" href="Teacher/VrpExamInfoUpdate?id=${vrpExamInfo.id}&pageNo=${pageNo}">${vrpExamInfo.examName}</a></td>
                            <td style="text-align:right;">${vrpExamInfo.questionCount}</td>
                            <td style="text-align:center;"><fmt:formatDate value="${vrpExamInfo.startTime }"/> </td>
                            <td style="text-align:center;"><fmt:formatDate value="${vrpExamInfo.startTime }"/></td>

                        </tr>
                        </c:forEach>
                    </table>
                    </form>
                </div>
                <div class="page mt10">
                    <div class="pagination">
                        <bh:BHPager pageNo="${pageNo}"  pageCount="${pageCount}"  url="Teacher/VrpExamManage?subject=${subject }"/>
                    </div>

                </div>
            </div>
        </div>



        
    </div>

    <script type="text/javascript">
         
       function SelectAll(){
        	$(":checkbox").each(function(){
        		$(this).prop({checked:true});
        	});
        }
        
        function UnSelectAll(){
        	$(":checkbox").each(function(){
        		$(this).prop({checked:false});
        	});
        }

		function deleteQuestion(){
			if(!confirm("真的要删除这些题目吗？"))
				return;
			$.post("Teacher/VrpExamInfoDelete",$("#questionForm").serialize(),
			function(data){						
						if (data.split("|")[0] != "0")
							self.location.reload();
						else
							alert(data.split("|")[1]);
			});	
		
		}

        parent.window.setLocation("装置仿真演示 - 考试管理");
    </script>
  </body>
</html>
