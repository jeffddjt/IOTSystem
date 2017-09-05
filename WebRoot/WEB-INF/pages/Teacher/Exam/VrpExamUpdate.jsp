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
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
     <script type="text/javascript" src="<%=path %>/assets/js/Validform_v5.3.2.js"></script>     
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>    
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>
    <script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>   
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/flowplayer/flowplayer-3.2.11.min.js"></script> 
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
		          			<div class="box_top"><b class="pl15">装置仿真考试</b></div>
		          			<div class="box_center">
                        	<form id="ResourceInfoForm" class="resourceInfoForm"  method="post">   
		          					<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
		          						<tr>
		          							<td class="td_right" style="vertical-align:top;">名称：</td>
		          							<td width="600">
		          								<input type="text" name="examName" value="${vrpExamInfo.examName}" class="textarea" style="width:600px;height:20px;">
		          							</td>
		          							<td></td>
		          						</tr>
		          						
		          						<tr>
		          							<td class="td_right" style="vertical-align: top;">题目数量：</td>
		          							<td width="600">
		          								<input type="text" name="questionCount" value="${vrpExamInfo.questionCount }" class="textarea" style="width:600px;height:20px;">
		          							</td>
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align: top;">开始时间：</td>
		          							<td width="600">
		          								<input type="text" name="questionCount" value='<fmt:formatDate value="${vrpExamInfo.startTime }"/>' class="textarea" style="width:600px;height:20px;">
		          							</td>
		          						</tr>		          						
		          						<tr>
		          							<td class="td_right" style="vertical-align: top;">结束时间：</td>
		          							<td width="600">
		          								<input type="text" name="questionCount" value='<fmt:formatDate value="${vrpExamInfo.stopTime }"/>' class="textarea" style="width:600px;height:20px;">
		          								
		          								<input type="hidden" name="id" value="${vrpExamInfo.id}"/>
		          								<input type="hidden" name="pageNo" value="${pageNo}"/>
		          								
		          							</td>
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


           $("#itemResFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
               uploader: '${pageContext.request.contextPath}/Teacher/QuestionManage/UpVrpFile',buttonText: '上传VRP压缩包',width: 120,fileObjName:'file',fileTypeExts:'*.zip',multi: true,
               onUploadSuccess: function (file, data, response) {
                   setUpVRPSuccess("#ItemRes",data);
               }
           });
           
           function setUpVRPSuccess(id,data){
           		$(id).val(data.split("|")[2]);
           		$("#ifrVrp").attr("src","${pageContext.request.contextPath}/"+data.split("|")[2]);
           }
            
       });

		
 		function btnSaveClick(){
		$.post("${pageContext.request.contextPath}/Teacher/VrpQuestionAdd",$("#ResourceInfoForm").serialize(),
			function(data){											
						if (data.split("|")[0] != "0"){
							alert("添加成功!");
							self.location.href="${pageContext.request.contextPath}/"+data.split("|")[1];
							}
						else
							alert(data.split("|")[1]);
			});	
			return true;
		} 

        parent.window.setLocation("装置仿真演示管理 - 考试管理 - 新增考试");
    </script>
  </body>
</html>