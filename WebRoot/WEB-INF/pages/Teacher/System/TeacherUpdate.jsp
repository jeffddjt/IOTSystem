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

     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/validate.css"/>
          <link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
     <script type="text/javascript" src="<%=path %>/assets/js/Validform_v5.3.2.js"></script>     
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>    
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>
    <script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>    
	<style>
		.questionItem {color:black;display:block;height:100%;width:100%;}
		.questionItem:hover{color:red;background:none;}
		
		.tr:hover{background:#eee;}
	</style>
  </head>
  
  <body>
        <div class="container">
  
          <div id="forms" class="mt10">
					<div class="box_border" id="ResourceInfoAdd">
		          			<div class="box_top"><b class="pl15">修改教师信息</b></div>
		          			<div class="box_center">
                        	<form id="ResourceInfoForm" class="resourceInfoForm"  method="post">   
		          					<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
		          						<tr>
		          							<td class="td_right" width="250" style="vertical-align: top">账号：</td>
		          							<td style="width:600px;">
		          							<input type="text"  name="account" value="${teacherInfo.account }" datatype="*" nullmsg="必须输入账号！" class="textarea"  style="width:600px;height:20px;"  ></td>
		          							<td><div class="Validform_checktip"></div></td>		          							
		          						</tr>
		          						<tr>
		          							<td class="td_right" width="250" style="vertical-align: top">姓名：</td>
		          							<td style="width:600px;">
		          							<input type="text"  name="userName" value="${teacherInfo.userName }" datatype="*" nullmsg="必须输入姓名！" class="textarea"  style="width:600px;height:20px;"  ></td>
		          							<td><div class="Validform_checktip"></div></td>		          							
		          						</tr>
		          						<tr>
		          							<td class="td_right" width="250" style="vertical-align: top">密码：</td>
		          							<td style="width:600px;"><input type="hidden" value="${teacherInfo.id }" name="id">
		          							<input type="password"  name="password" value="${teacherInfo.password}" datatype="*" nullmsg="必须输入密码！" class="textarea"  style="width:600px;height:20px;"  ></td>
		          							<td><div class="Validform_checktip"></div></td>		          							
		          						</tr>	          						
		          					</table>
									</form>
		          			</div>
		          			
		          	</div>

         </div>
              <div class="box_border">
                    <div class="box_top"><b class="pl15">操作栏</b></div>
                    <div class="box_center">
                            <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right">&nbsp;</td>
                                    <td class="">
                                    	<input type="button" value="保存"  id="btnSave" class="btn btn82 btn_save2"  onclick="btnSaveClick()">
                                        <input type="button" name="button" class="btn btn82 btn_res" value="返回" onclick="history.go(-1)"/>
                                    </td>
                                </tr>
                            </table>
                    </div>
                </div>
       </div>

    <script type="text/javascript">
       $(function(){
       
           $(".resourceInfoForm").Validform({
          tiptype:2
         });   
         
         });  



		
 		function btnSaveClick(){
		$.post("${pageContext.request.contextPath}/Teacher/TeacherUpdate",$("#ResourceInfoForm").serialize(),
			function(data){											
						if (data.split("|")[0] != "0"){
							alert("修改成功!");
							self.location.href="${pageContext.request.contextPath}/"+data.split("|")[1];
							}
						else
							alert(data.split("|")[1]);
			});	
			return true;
		} 

        parent.window.setLocation("系统管理--教师管理--修改");
    </script>
  </body>
</html>