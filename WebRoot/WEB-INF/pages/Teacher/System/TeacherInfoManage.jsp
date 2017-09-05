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
		a{color:black;width:100%;height:100%;display:block;}
		a:hover{color:red;}
	</style>

  </head>
  
  <body>
    <div class="container">
    	  <div id="button" class="mt10">
            <input type="button" name="button" class="btn btn82 btn_add" value="新增"  onclick="window.location.href = '${pageContext.request.contextPath}/Teacher/TeacherInfoAdd'" />
            <input type="button" name="button" class="btn btn82 btn_del" value="删除"  onclick="deleteResourceInfo()"/>
            <input type="button" name="button" class="btn btn82 btn_checked" value="全选" onclick="SelectAll()"/>
            <input type="button" name="button" class="btn btn82 btn_nochecked" value="取消" onclick="UnSelectAll()"/>
        </div>   
        
            <div id="table" class="mt10">
            <div class="box span10 oh">
                <div id="contentDiv" >
                		<form id="TeacherInfo">
                		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>
                            <th width="200"> 账号 </th >
                            <th width="200">姓名</th>
                            <th></th>

                        </tr>
                        <c:forEach items="${TeacherInfoList}" var="teacherInfo">
                        	<tr class="tr">
                        		<td class="td_center"><input type="checkbox" name="selected" value="${teacherInfo.id }" ></td>
                        		<td class="td_center"><a href="Teacher/TeacherUpdate?id=${teacherInfo.id}">${teacherInfo.account}</a></td>
                        		<td class="td_center"><a href="Teacher/TeacherUpdate?id=${teacherInfo.id}">${teacherInfo.userName}</a></td>
                        		<td></td>

                        	</tr>
                        </c:forEach>
                        </table>
                		</form>
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
			if(!confirm("真的要删除这些教师信息吗？"))
				return;
			$.post("${pageContext.request.contextPath}/Teacher/TeacherInfoDelete",$("#TeacherInfo").serialize(),
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
    
    	parent.window.setLocation("系统管理 - 教师管理");
    </script>
  </body>
</html>
