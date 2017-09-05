<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link href="<%=path%>/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
     <script type="text/javascript" src="<%=path%>/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/assets/js/jquery.SuperSlide.js"></script>
     <script type="text/javascript" src="<%=path%>/assets/js/navSlide.js">  </script>
	<style>
		.questionItem {color:black;display:block;height:100%;width:100%;}
		.questionItem:hover{color:red;background:none;}
		
		.tr:hover{background:#eee;}
	    a{color:black;width:100%;height:100%;display:block;}
		a:hover{color:red;}
	</style>

  </head>
  
  <body>
    <div class="container">
 
 			<div id="search" class="mt10">
            <div class="box">
                <div class="box_border">
                    <div class="box_top"><b class="pl15">学生信息</b></div>
                    <div class="box_center pt10 pb10" style="margin:10px 40px;">
							<span>学号：${studentInfo.stu_id }&nbsp;&nbsp;&nbsp;&nbsp;姓名:${studentInfo.stu_name }</span>
                    </div>
                 </div>
 			</div>
 		</div>
        
            <div id="table" class="mt10">
            <div class="box span10 oh">
                <div id="contentDiv" >
                	<form id="StudentInfo">                		
                		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>
                            <th> 考试名称 </th >
                            <th width="100">考试科目</th>
                            <th width="100">考试成绩</th>
                            <th width="150">开始时间</th>
                            <th width="150">结束时间</th>
                        </tr>
                        	<c:forEach items="${examPaperViewList}" var="examPaper" >
                        <tr class="tr">
                        	<td>${examPaper.id}</td>
                        	<td><a href="Teacher/ExamPaperBrowse?id=${examPaper.id}">${examPaper.examName }</a></td>
                        	<td>${examPaper.subject }</td>
                        	<td>${examPaper.stu_score}</td>
                        	<td><fmt:formatDate value="${examPaper.start_time}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                        	<td><fmt:formatDate value="${examPaper.stop_time}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                        </tr>
                             </c:forEach>
                        </table>
                		</form>
                </div>
            </div>
            </div>
            
              <div class="box_border">
                    <div class="box_center">
                            <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="">
                                        <input type="button" name="button" class="btn btn82 btn_save2" value="返回" onclick="history.go(-1)"/>
                                    </td>
                                </tr>
                            </table>
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

		function deleteResourceInfo(){
			if(!confirm("真的要删除这些学生信息吗？"))
				return;
			$.post("Teacher/StudentInfoDelete",$("#StudentInfo").serialize(),
			function(data){						
						if (data.split("|")[0] != "0")
						{
							alert(data.split("|")[1]);
							self.location.reload();
							}
						else
							alert(data.split("|")[1]);
			});	
		
		}
    
    	parent.window.setLocation("学生管理 - 信息管理");
    </script>
  </body>
</html>
