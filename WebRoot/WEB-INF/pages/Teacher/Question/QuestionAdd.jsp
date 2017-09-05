<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>仪表工在线顶岗实训系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<!--     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css"/> -->
<link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script>
<style type="text/css">
	.text {
		height:20px;
		width:600px;
		border:1px solid #ccc;
		
	}
</style>

</head>

<body>
	<div class="container">
		<div id="forms" class="mt10">
			<div class="box">
				<div class="box_border" id="question">
					
                    <div class="box_top"><b class="pl15">题目信息</b></div>
                    <div class="box_center">
                            <table >
                            <tr>
                            	<td class="td_right" style="vertical-align:top">科目</td>
                            	<td>
                            		<select name="subject" id="subjectSelector" disabled="disabled">
                            			<c:forEach items="${subjectList}" var="sub">
                            				<option value="${sub.id}">${sub.subject}</option>
                            			</c:forEach>
                            		</select>
                            	</td>
                            </tr>
                            <tr>
                            	<td class="td_right" style="vertical-align:top">题型：</td>
                            	<td>
                            		<select name="type" id="typeSelector">
                            			<c:forEach items="${questionTypeList }" var="questionType">
                            				<option value="${questionType.id}">${questionType.questionType}</option>
                            			</c:forEach>
                            		</select>
                            	</td>
                            </tr>
                           </table>
                           
								<form id="questionForm1">
								<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right" style="vertical-align:top">题干文本：</td>
                                    <td class="">
                                        <div style="float:left"><textarea name="itemText" id="questionName1" cols="150" rows="40" class="textarea" style="width:600px">${question.itemText }</textarea></div>
                                        <div style="color:red" id="questionNameTip"></div>
                                    </td>
                                </tr>								
								<tr>
									<td class="td_right" style="vertical-align:top">选项A：</td>
									<td>
										<input type="file" id="choiceA1" >
										<input type="hidden" name="choiceA1" value="${question.choiceA1}">
										<img alt="加载图片" src="${pageContext.request.contextPath}/${question.choiceA1}" width="230" height="230">
									</td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项B：</td>
									<td>
										<input type="file" id="choiceB1">
										<input type="hidden" name="choiceB1" value="${question.choiceB1}">
										<img alt="加载图片" src="${pageContext.request.contextPath}/${question.choiceB1}" width="230" height="230">
									</td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项C：</td>
									<td>
										<input type="file" id="choiceC1">
										<input type="hidden" name="choiceC1" value="${question.choiceC1}">
										<img alt="加载图片" src="${pageContext.request.contextPath}/${question.choiceC1}" width="230" height="230">
									</td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项D：</td>
									<td>
										<input type="file" id="choiceD1">
										<input type="hidden" name="choiceD1" value="${question.choiceD1}">
										<img alt="加载图片" src="${pageContext.request.contextPath}/${question.choiceD1}" width="230" height="230">
									</td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">正确答案：</td>
									<td>
										<label><input type="radio" name="answer1" value="A">A</label>
										<label><input type="radio" name="answer1" value="B">B</label>
										<label><input type="radio" name="answer1" value="C">C</label>
										<label><input type="radio" name="answer1" value="D">D</label>
										<input type="hidden" name="subject" value="${question.subject}">
										<input type="hidden" name="type" value="${question.type }">
										<input type="hidden" name="id" value="${question.id}">
									</td>
								</tr>	
								</table>								
                                </form>

                                
								<form id="questionForm2">
								<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr >
                                    <td class="td_right" style="vertical-align:top">题干文本：</td>
                                    <td class="" >
                                        <div style="float:left"><textarea name="itemText" id="questionName2" cols="150" rows="40" class="textarea" style="width:600px">${question.itemText }</textarea></div>
                                        <div style="color:red" id="questionNameTip"></div>
                                    </td>
                                </tr>                                
								<tr>
									<td class="td_right" style="vertical-align:top">题干图片：</td>
									<td>
										<input type="file" id="itemRes">
										<img alt="加载图片" src="${pageContext.request.contextPath}/${question.itemRes}" width="230" height="230">
										<input type="hidden" name="itemRes" value="${question.itemRes}">
									</td>									
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项A:</td>
									<td><input type="text" class="text" name="choiceA1" value="${question.choiceA1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项B:</td>
									<td><input type="text" class="text" name="choiceB1" value="${question.choiceB1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项C:</td>
									<td><input type="text" class="text" name="choiceC1" value="${question.choiceC1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项D:</td>
									<td><input type="text" class="text" name="choiceD1" value="${question.choiceD1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">正确答案：</td>
									<td>
										<label><input type="radio" name="answer1" value="A">A</label>
										<label><input type="radio" name="answer1" value="B">B</label>
										<label><input type="radio" name="answer1" value="C">C</label>
										<label><input type="radio" name="answer1" value="D">D</label>
										<input type="hidden" name="subject" value="${question.subject}">
										<input type="hidden" name="type" value="${question.type }">
										<input type="hidden" name="id" value="${question.id}">
										
									</td>
								</tr>	
								</table>
								</form>
								
								
								<form id="questionForm3">
								<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right" style="vertical-align:top">题干文本：</td>
                                    <td class="">
                                        <div style="float:left"><textarea name="itemText" id="questionName3" cols="150" rows="40" class="textarea" style="width:600px;">${question.itemText }</textarea></div>
                                        <div style="color:red" id="questionNameTip"></div>
                                    </td>
                                </tr>								
								<tr>
									<td class="td_right" style="vertical-align:top">选项A:</td>
									<td><input type="text" class="text" name="choiceA1" value="${question.choiceA1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项B:</td>
									<td><input type="text" class="text" name="choiceB1" value="${question.choiceB1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项C:</td>
									<td><input type="text" class="text" name="choiceC1" value="${question.choiceC1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项D:</td>
									<td><input type="text" class="text" name="choiceD1" value="${question.choiceD1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">正确答案：</td>
									<td>
										<label><input type="radio" name="answer1" value="A">A</label>
										<label><input type="radio" name="answer1" value="B">B</label>
										<label><input type="radio" name="answer1" value="C">C</label>
										<label><input type="radio" name="answer1" value="D">D</label>
									</td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项A：</td>
									<td><input type="file" id="choiceA2">
										<input type="hidden" name="choiceA2" value="${question.choiceA2}">
										<img alt="加载图片" src="${pageContext.request.contextPath}/${question.choiceA2}" width="160" height="160">									
									</td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项B：</td>
									<td><input type="file" id="choiceB2">
										<input type="hidden" name="choiceB2" value="${question.choiceB2}">
										<img alt="加载图片" src="${pageContext.request.contextPath}/${question.choiceB2}" width="160" height="160">										
									</td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项C：</td>
									<td><input type="file" id="choiceC2">
										<input type="hidden" name="choiceC2" value="${question.choiceA2}">
										<img alt="加载图片" src="${pageContext.request.contextPath}/${question.choiceC2}" width="160" height="160">										
									</td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项D：</td>
									<td><input type="file" id="choiceD2">
										<input type="hidden" name="choiceD2" value="${question.choiceD2}">
										<img alt="加载图片" src="${pageContext.request.contextPath}/${question.choiceD2}" width="160" height="160">										
									</td>
								</tr>				
								<tr>
									<td class="td_right" style="vertical-align:top">正确答案：</td>
									<td>
										<label><input type="radio" name="answer2" value="A">A</label>
										<label><input type="radio" name="answer2" value="B">B</label>
										<label><input type="radio" name="answer2" value="C">C</label>
										<label><input type="radio" name="answer2" value="D">D</label>
										<input type="hidden" name="subject" value="${question.subject}">
										<input type="hidden" name="type" value="${question.type }">
										<input type="hidden" name="id" value="${question.id}">
										
									</td>
								</tr>								
												
								</table>
								</form>
								
								
								<form id="questionForm4">
								<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right" style="vertical-align:top">题干文本：</td>
                                    <td class="">
                                        <div style="float:left"><textarea name="itemText" id="questionName4" cols="150" rows="40" class="textarea" style="width:600px">${question.itemText }</textarea></div>
                                        <div style="color:red" id="questionNameTip"></div>
                                    </td>
                                </tr>								
								<tr>
									<td class="td_right" style="vertical-align:top">选项A:</td>
									<td><input type="text" class="text" name="choiceA1" value="${question.choiceA1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项B:</td>
									<td><input type="text" class="text" name="choiceB1" value="${question.choiceB1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项C:</td>
									<td><input type="text" class="text" name="choiceC1" value="${question.choiceC1}"></td>
								</tr>
								<tr>
									<td class="td_right" style="vertical-align:top">选项D:</td>
									<td><input type="text" class="text" name="choiceD1" value="${question.choiceD1}"></td>
								</tr>				
								<tr>
									<td class="td_right" style="vertical-align:top">正确答案：</td>
									<td>
										<label><input type="radio" name="answer1" value="A">A</label>
										<label><input type="radio" name="answer1" value="B">B</label>
										<label><input type="radio" name="answer1" value="C">C</label>
										<label><input type="radio" name="answer1" value="D">D</label>
										<input type="hidden" name="subject" value="${question.subject}">
										<input type="hidden" name="type" value="${question.type }">
										<input type="hidden" name="id" value="${question.id}">
										
									</td>
								</tr>	
								</table>
								</form>

                    </div>
                    
                </div>
			
			      <div class="box_border">
                    <div class="box_top"><b class="pl15">操作栏</b></div>
                    <div class="box_center">
                            <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right">&nbsp;</td>
                                    <td class="">
                                    	<input type="button" value="保存" class="btn btn82 btn_save2" onclick="return btnSaveClick();">
                                        <input type="button" name="button" class="btn btn82 btn_res" value="返回" onclick="history.go(-1)"/>
                                    </td>
                                </tr>
                            </table>
                    </div>
                </div>
			
			
			</div>
		</div>
	</div>
  <script type="text/javascript">
  
   $("#selector").val("${question.type}"); 
  	var s="question"
	
	var editor=CKEDITOR.replace("questionName${question.type}");

	$("#typeSelector").change(function () {
		location.href="${pageContext.request.contextPath}/Teacher/QuestionAdd?subject=${question.subject}&type="+$(this).val();
	});
	  
  	$(function () {
           $("#itemRes").uploadify({
                height: 30, swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/QuestionManage/UpPhotoFile',buttonText: '上传图片',width: 120,fileObjName:'file',fileTypeExts:'*.jpg',multi: true,
                onUploadSuccess: function (file, data, response) {                     	          	
                    	setUpPhotoSuccess("itemRes",data);
                }
            });
           $("#choiceA1").uploadify({
                height: 30, swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/QuestionManage/UpPhotoFile',buttonText: '上传图片',width: 120,fileObjName:'file',fileTypeExts:'*.jpg',multi: true,
                onUploadSuccess: function (file, data, response) {                     	          	
                    	setUpPhotoSuccess("choiceA1",data);
                }
            });
           $("#choiceB1").uploadify({
                height: 30, swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/QuestionManage/UpPhotoFile',buttonText: '上传图片',width: 120,fileObjName:'file',fileTypeExts:'*.jpg',multi: true,
                onUploadSuccess: function (file, data, response) {                     	          	
                    	setUpPhotoSuccess("choiceB1",data);
                }
            });
             $("#choiceC1").uploadify({
                height: 30, swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/QuestionManage/UpPhotoFile',buttonText: '上传图片',width: 120,fileObjName:'file',fileTypeExts:'*.jpg',multi: true,
                onUploadSuccess: function (file, data, response) {                     	          	
                    	setUpPhotoSuccess("choiceC1",data);
                }
            });
            $("#choiceD1").uploadify({
                height: 30, swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/QuestionManage/UpPhotoFile',buttonText: '上传图片',width: 120,fileObjName:'file',fileTypeExts:'*.jpg',multi: true,
                onUploadSuccess: function (file, data, response) {                     	          	
                    	setUpPhotoSuccess("choiceD1",data);
                }
            });
              $("#choiceA2").uploadify({
                height: 30, swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/QuestionManage/UpPhotoFile',buttonText: '上传图片',width: 120,fileObjName:'file',fileTypeExts:'*.jpg',multi: true,
                onUploadSuccess: function (file, data, response) {                     	          	
                    	setUpPhotoSuccess("choiceA2",data);
                }
            });
              $("#choiceB2").uploadify({
                height: 30, swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/QuestionManage/UpPhotoFile',buttonText: '上传图片',width: 120,fileObjName:'file',fileTypeExts:'*.jpg',multi: true,
                onUploadSuccess: function (file, data, response) {                     	          	
                    	setUpPhotoSuccess("choiceB2",data);
                }
            });
              $("#choiceC2").uploadify({
                height: 30, swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/QuestionManage/UpPhotoFile',buttonText: '上传图片',width: 120,fileObjName:'file',fileTypeExts:'*.jpg',multi: true,
                onUploadSuccess: function (file, data, response) {                     	          	
                    	setUpPhotoSuccess("choiceC2",data);
                }
            });

                $("#choiceD2").uploadify({
                height: 30, swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/QuestionManage/UpPhotoFile',buttonText: '上传图片',width: 120,fileObjName:'file',fileTypeExts:'*.jpg',multi: true,
                onUploadSuccess: function (file, data, response) {                     	          	
                    	setUpPhotoSuccess("choiceD2",data);
                }
            });
            
            function setUpPhotoSuccess(id,data) {
				$("#"+id).parent().children("img").attr("src","${pageContext.request.contextPath}/"+data.split('|')[2]);
				$("input[name='"+id+"']").val(data.split('|')[2]);
            }
  	
  	});
  	
  	      function btnSaveClick() {      
  	      	$("#questionName${question.type}").val(editor.getData());        	         
            $.post("${pageContext.request.contextPath}/Teacher/QuestionAdd",$("#questionForm${question.type}").serialize(),function(data){
            	if(data.split("|")[0]=="0"){
            		alert(data.split("|")[1]);
            	}else {
            		alert("添加成功!");
 					window.location.href="${pageContext.request.contextPath}/"+data.split("|")[1];
            	}
            	
            });
            

            return true;
        }
		
		
		for(var i=1;i<=4;i++){
			$("#questionForm"+i).css("display","none");
		}
		
		$("#typeSelector").val('${question.type}');
		$("#subjectSelector").val('${question.subject}');
		$("#questionForm${question.type}").css("display","block");
		
		$("input[name='answer1'][value='${question.answer1}']").attr("checked",true);
		$("input[name='answer2'][value='${question.answer2}']").attr("checked",true);
		
        parent.window.setLocation("题库管理 - 修改试题");
  </script>
</body>
</html>
