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
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script> 
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
		          			<div class="box_top"><b class="pl15">操作训练及考核设置</b></div>
		          			<div class="box_center">
                        	<form id="ResourceInfoForm" class="resourceInfoForm"   method="post">   
		          					<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
		          						<tr>
		          							<td class="td_right" style="vertical-align:top;">操作练习VRP：</td>
		          							<td width="600">
		          								<input type="file" id="testVrpFile" name="file">
		          								<input type="text" id="testVrp" name="testVrp" class="textarea" style="width:600px;height:20px;" readonly="readonly" value="${operation.testVrp}">
		          							</td>
		          							<td></td>
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align:top;">操作考核VRP：</td>
		          							<td width="600">
		          								<input type="file" id="examVrpFile" name="file">
		          								<input type="text" id="examVrp" name="examVrp" class="textarea" style="width:600px;height:20px;" readonly="readonly" value="${operation.examVrp}">
		          								<input type="hidden" name="subject" value="${subjectInfo.id}">
		          								<input type="hidden" name="id" value="${operation.id}">
		          							</td>
		          							<td></td>
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
                                    </td>
                                </tr>
                            </table>
                    </div>
                </div>
       </div>

    <script type="text/javascript">
     $(function(){
              
         
           $("#testVrpFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
               uploader: '${pageContext.request.contextPath}/Teacher/OperationManage/UpVrpFile',buttonText: '上传VRP压缩包',width: 120,fileObjName:'file',fileTypeExts:'*.zip',multi: true,
               onUploadSuccess: function (file, data, response) {
                   setUpVRPSuccess("#testVrp",data);
               }
           });
           $("#examVrpFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
               uploader: '${pageContext.request.contextPath}/Teacher/OperationManage/UpVrpFile',buttonText: '上传VRP压缩包',width: 120,fileObjName:'file',fileTypeExts:'*.zip',multi: true,
               onUploadSuccess: function (file, data, response) {
                   setUpVRPSuccess("#examVrp",data);
               }
           });

           
           function setUpVRPSuccess(id,data){
           		$(id).val(data.split("|")[2]);
           }
            
       });

		
 		function btnSaveClick(){
		$.post("${pageContext.request.contextPath}/Teacher/OperationUpdate",$("#ResourceInfoForm").serialize(),
			function(data){											
						if (data.split("|")[0] != "0"){
							alert("修改成功!");
							self.location.href="${pageContext.request.contextPath}/"+data.split("|")[1];
							}
						else
							alert(data.split("|")[1]);
			});	
		} 

        parent.window.setLocation("${subjectInfo.subject}--操作训练及考核设置");
    </script>
  </body>
</html>