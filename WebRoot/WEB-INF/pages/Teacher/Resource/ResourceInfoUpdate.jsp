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
		          			<div class="box_top"><b class="pl15">修改资源信息</b></div>
		          			<div class="box_center">
                        	<form id="ResourceInfoForm" class="resourceInfoForm" action="Teacher/ResourceInfoUpdate" method="post">   
		          					<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
		          						<tr>
		          							<td class="td_right" width="250" style="vertical-align: top">资源编号：</td>
		          							<td width="600" ><input type="text" name="resNum"  value="${ResourceInfo.resNum}" class="textarea"  style="width:600px;height:20px;" ></td>
											<td></td>
		          						</tr>
		          						<tr>
		          							<td class="td_right" width="250" style="vertical-align: top">资源名称：</td>
		          							<td>
		          							<input type="text"  id="resourceInfoName" value="${ResourceInfo.resName}" name="resName"  class="textarea"  style="width:600px;height:20px;"  >
		          							</td>
											<td></td>		          							
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align: top">资源拼音：</td>
		          							<td>
		          								<input type="text"  class="textarea" value="${ResourceInfo.resPinyin}" name="resPinyin" style="width:600px;height:20px;">
		          							</td>
		          							<td></td>
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align: top">功能描述：</td>		          							
		          							<td>
		          							<textarea rows="40" cols="150" id="resFun" name="resFun" style="width:600px" class="textarea">${ResourceInfo.resFun}</textarea>
											</td>
		          							 <td></td>
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align: top">应用描述：</td>
		          							<td>
		          							<textarea rows="40" cols="150" id="resApp" name="resApp" style="width:600px" class="textarea">${ResourceInfo.resApp}</textarea>
		          							</td>
		          							<td></td> 
		          						<tr>
		          						<td class="td_right" style="vertical-align: top">教学VRP：</td>
		          						<td>
		          								<input type="file" id="upResourceVRPFile" type="file" name="file" class="input-text lh30" size="30">
		          								 <input type="hidden" id="upResourceVRPPath" name="resVrp" value="${ResourceInfo.resVrp}">
		          								<input type="hidden" name="id" value="${ResourceInfo.id}">
		          								<input type="hidden" name="subject" value="${ResourceInfo.subject }">
		          								<iframe id="ifrVrp" width="600" height="400" allowtransparency="true" style="border:1px solid #ccc;" src="${pageContext.request.contextPath}/${ResourceInfo.resVrp}"></iframe>		          						
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
                                        <input type="button" name="button" class="btn btn82 btn_res" value="返回" onclick="history.go(-1)"/>
                                    </td>
                                </tr>
                            </table>
                    </div>
                </div>
       </div>

    <script type="text/javascript">
      
         var resFun=CKEDITOR.replace("resFun");
         var resApp=CKEDITOR.replace("resApp");
         
       $(function(){
              
         
            $("#upResourceVRPFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/ResourceInfoManage/UpVrpFile',buttonText: '上传VRP压缩包',width: 120,fileObjName:'file',fileTypeExts:'*.zip',multi: true,
                onUploadSuccess: function (file, data, response) {
                    setUpVRPSuccess(data);
                }
            });
            
            
           function setUpVRPSuccess(data){
              
              if(data.split("|")[0]=="1"){
				$("#upResourceVRPPath").val(data.split("|")[2]);
				$("#ifrVrp").attr("src","${pageContext.request.contextPath}/"+data.split("|")[2]);
              }
              else{
              	alert(data.split("|")[1]);
              }
           } 
         
       });


		
 		function btnSaveClick(){
 		$("#resFun").val(resFun.getData());
 		$("#resApp").val(resApp.getData());
		$.post("${pageContext.request.contextPath}/Teacher/ResourceInfoUpdate",$("#ResourceInfoForm").serialize(),
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

        parent.window.setLocation("${subjectInfo.subject} - 设置--修改资源");
    </script>
  </body>
</html>