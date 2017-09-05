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
		.tr {cursor:point;}
		.tr:hover{background:#eee;}
		a{color:black;}
		a:hover{color:red;}
	</style>

  </head>
  
  <body>
    <div class="container">
    	  <div id="button" class="mt10">
            <input type="button" name="button" class="btn btn82 btn_add" value="新增"  onclick="window.location.href = '${pageContext.request.contextPath}/Teacher/StudentInfoAdd'" />
            <input type="button" name="button" class="btn btn82 btn_del" value="删除"  onclick="deleteResourceInfo()"/>
            <input type="button" name="button" class="btn btn82 btn_checked" value="全选" onclick="SelectAll()"/>
            <input type="button" name="button" class="btn btn82 btn_nochecked" value="取消" onclick="UnSelectAll()"/>
        </div>   
        
            <div id="table" class="mt10">
            <div class="box span10 oh">
                <div id="contentDiv" >
                		<form id="StudentInfo">
                		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>
                            <th width="100"> 学号 </th >
                            <th width="100">姓名</th>
                            <th width="100">资源星级</th>
                            <th width="100">现场星级</th>
                            <th width="100">巡检星级</th>
                            <th width="100">故障处理星级</th>
                            <th width = "100" >检修星级</th>
                            <th width = "150" >等级 </th> 
                            <th width="150">在线时长 </th>
                            <th width="150">操作</th>
                        </tr>
                        <c:forEach items="${StudentInfoList}" var="studentInfo">
                        	<tr class="tr">
                        		<td class="td_center"><input type="checkbox" name="selected" style="width:18px;height:18px;" value="${studentInfo.stu_id }" ></td>
                        		<td class="td_center"><a href="Teacher/StudentUpdate?stu_id=${studentInfo.stu_id}">${studentInfo.stu_id}</a></td>
                        		<td class="td_center"><a href="Teacher/StudentUpdate?stu_id=${studentInfo.stu_id}">${studentInfo.stu_name}</a></td>
                        		<td class="td_right">${studentInfo.star_res}</td>
                        		<td class="td_right">${studentInfo.star_dem}</td>
                        		<td class="td_right">${studentInfo.star_mai}</td>
                        		<td class="td_right">${studentInfo.star_dea}</td>
                        		<td class="td_right">${studentInfo.star_ove}</td>
                        		<td class="td_right">${studentInfo.stu_grade}</td>
                        		<td class="td_right">${studentInfo.online_time}</td>
                        		<td class="td_center">
                        		<a href="Teacher/StudentUpdate?stu_id=${studentInfo.stu_id}">信息维护</a>
                        		&nbsp;&nbsp;&nbsp;&nbsp;
                        		 <a href="Teacher/ScoreManage?stu_id=${studentInfo.stu_id}">查看成绩</a></td>
                        	</tr>
                        </c:forEach>
                        </table>
                		</form>
                </div>
         		<div class="page mt10">
						<div class="pagination">
							<bh:BHPager pageNo="${pageNo}" url="${pageContext.request.contextPath}/Teacher/StudentInfo?" pageCount="${pageCount}"/>
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

		function deleteResourceInfo(){
			if(!confirm("真的要删除这些学生信息吗？"))
				return;
			$.post("${pageContext.request.contextPath}/Teacher/StudentInfoDelete",$("#StudentInfo").serialize(),
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
