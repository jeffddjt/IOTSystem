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
		          			<div class="box_top"><b class="pl15">${title }</b></div>
		          			<div class="box_center">
                        	<form id="ResourceInfoForm" class="resourceInfoForm"  method="post">   
		          					<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
		          						<tr>
		          							<td class="td_right" style="vertical-align:top;">操作台学习：</td>
		          							<td width="600">
		          								<input type="file" id="studyConsoleFile" name="file">
		          								<input type="hidden" id="studyConsole" name="study_console" value="${polling.study_console}">
		          								<div id="consolePlayer" style="width:600px;height:450px;"></div>
		          							</td>
		          							<td></td>
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align:top;">操作台练习：</td>
		          							<td width="600">
		          								<input type="file" id="testConsoleFile" name="file">
		          								<input type="text" id="testConsole" name="test_console" class="textarea" style="width:600px;height:20px;" readonly="readonly" value="${polling.test_console}">
		          							</td>
		          							<td></td>
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align:top;">操作台考核：</td>
		          							<td width="600">
		          								<input type="file" id="examConsoleFile" name="file">
		          								<input type="text" id="examConsole" name="exam_console" class="textarea" style="width:600px;height:20px;" readonly="readonly" value="${polling.exam_console}">
		          							</td>
		          							<td></td>
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align:top;">现场学习：</td>
		          							<td width="600">
		          								<input type="file" id="studySceneFile" name="file">
		          								<input type="hidden" id="studyScene" name="study_scene" value="${polling.study_scene}">
		          								<div id="scenePlayer" style="width:600px;height:450px;"></div>
		          							</td>
		          							<td></td>
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align:top;">现场练习：</td>
		          							<td width="600">
		          								<input type="file" id="testSceneFile" name="file">
		          								<input type="text" id="testScene" name="test_scene" class="textarea" style="width:600px;height:20px;" readonly="readonly" value="${polling.test_scene}">
		          							</td>
		          							<td></td>
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align:top;">现场考核：</td>
		          							<td width="600">
		          								<input type="file" id="examSceneFile" name="file">
		          								<input type="text" id="examScene" name="exam_scene" class="textarea" style="width:600px;height:20px;" readonly="readonly" value="${polling.exam_scene}">
		          							</td>
		          							<td><input type="hidden" name="type" value="${polling.type}"></td>
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
              
         
           $("#studyConsoleFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
               uploader: '${pageContext.request.contextPath}/Teacher/PollingVideoManage/UpVideoFile',buttonText: '上传视频文件',width: 120,fileObjName:'file',fileTypeExts:'*.flv;*.mp4',multi: true,
               onUploadSuccess: function (file, data, response) {
                   setUpVRPSuccess("#studyConsole",data);
                   setPlayer("consolePlayer","${pageContext.request.contextPath}/"+data.split("|")[2]);
               }
           });
           $("#testConsoleFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
               uploader: '${pageContext.request.contextPath}/Teacher/PollingManage/UpVrpFile',buttonText: '上传VRP压缩包',width: 120,fileObjName:'file',fileTypeExts:'*.zip',multi: true,
               onUploadSuccess: function (file, data, response) {
                   setUpVRPSuccess("#testConsole",data);
               }
           });
           $("#examConsoleFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
               uploader: '${pageContext.request.contextPath}/Teacher/PollingManage/UpVrpFile',buttonText: '上传VRP压缩包',width: 120,fileObjName:'file',fileTypeExts:'*.zip',multi: true,
               onUploadSuccess: function (file, data, response) {
                   setUpVRPSuccess("#examConsole",data);
               }
           });
           $("#studySceneFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
               uploader: '${pageContext.request.contextPath}/Teacher/PollingVideoManage/UpVideoFile',buttonText: '上传视频文件',width: 120,fileObjName:'file',fileTypeExts:'*.flv;*.mp4',multi: true,
               onUploadSuccess: function (file, data, response) {
                   setUpVRPSuccess("#studyScene",data);  
                   setPlayer("scenePlayer","${pageContext.request.contextPath}/"+data.split("|")[2]);                 
               }
           });
           $("#testSceneFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
               uploader: '${pageContext.request.contextPath}/Teacher/PollingManage/UpVrpFile',buttonText: '上传VRP压缩包',width: 120,fileObjName:'file',fileTypeExts:'*.zip',multi: true,
               onUploadSuccess: function (file, data, response) {
                   setUpVRPSuccess("#testScene",data);
               }
           });
           $("#examSceneFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
               uploader: '${pageContext.request.contextPath}/Teacher/PollingManage/UpVrpFile',buttonText: '上传VRP压缩包',width: 120,fileObjName:'file',fileTypeExts:'*.zip',multi: true,
               onUploadSuccess: function (file, data, response) {
                   setUpVRPSuccess("#examScene",data);
               }
           });
           
           function setUpVRPSuccess(id,data){
           		$(id).val(data.split("|")[2]);
           }
            
       });

        setPlayer("consolePlayer","${pageContext.request.contextPath}/${polling.study_console}") ;
        setPlayer("scenePlayer","${pageContext.request.contextPath}/${polling.study_scene}");
		function setPlayer(player,urlpath){
			flowplayer(player, "${pageContext.request.contextPath}/assets/js/flowplayer/flowplayer-3.2.12.swf", { clip: { url: urlpath, autoPlay: false, autoBuffering: true} });
		}
		
 		function btnSaveClick(){
		$.post("${pageContext.request.contextPath}/Teacher/PollingUpdate",$("#ResourceInfoForm").serialize(),
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

        parent.window.setLocation("${title}");
    </script>
  </body>
</html>