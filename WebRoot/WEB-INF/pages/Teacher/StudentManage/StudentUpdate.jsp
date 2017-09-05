<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/validate.css" />
<link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/Validform_v5.3.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>
<script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>
<style>
.questionItem {
	color: black;
	display: block;
	height: 100%;
	width: 100%;
}

.questionItem:hover {
	color: red;
	background: none;
}

.tr:hover {
	background: #eee;
}
</style>
</head>

<body>
	<div class="container">

		<div id="forms" class="mt10">
			<div class="box_border" id="updateStudent">
				<div class="box_top">
					<b class="pl15">信息维护</b>
				</div>
				<div class="box_center">
					<form id="StudentInfoForm" class="resourceInfoForm" method="post">
						<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td class="td_right">学号:</td>
								<td style="width:200px;">${studentInfo.stu_id}<input type="hidden"name="stu_id" value="${studentInfo.stu_id }">
								</td>
								<td><div class="Validform_checktip"></div></td>
							</tr>
							<tr>
								<td class="td_right">姓名:</td>
								<td><input type="text" class="textarea" style="width:200px;height:20px;" datatype="*"  name="stu_name"  value="${studentInfo.stu_name}"></td>
								<td><div class="Validform_checktip"></div></td>
							</tr>
							<tr>
								<td class="td_right" style="vertical-align: top;">头像:</td>
								<td>
									<div style="width:120px;">
										<img id="pic" alt="学生头像" src="${pageContext.request.contextPath}/${studentInfo.stu_pic}" width="120" height="156" onerror="this.style.display='none'">
										 <input type="hidden" id="stu_pic" name="stu_pic" value="${studentInfo.stu_pic }">
									</div>
									<div style="width:120px;">
										<input type="file" id="stu_head" style="width:120px;">
									</div>
								</td>
								<td><div class="Validform_checktip"></div></td>
							</tr>
							<tr>
								<td class="td_right">密码:</td>
								<td><input type="password" class="textarea" style="width:200px;height:20px;" id="pwd"> 
								<input	type="hidden" id="stu_pwd" name="stu_pwd"  value="${studentInfo.stu_pwd }"></td>
								<td><div class="Validform_checktip"></div></td>
							</tr>
							<tr>
								<td class="td_right">资源星级:</td>
								<td><input type="text" class="textarea" datatype="n" style="width:200px;height:20px;" name="star_res" value="${studentInfo.star_res}"></td>
								<td><div class="Validform_checktip"></div></td>
							</tr>
							<tr>
								<td class="td_right">现场星级:</td>
								<td><input type="text" class="textarea" datatype="n"  style="width:200px;height:20px;" name="star_dem" value="${studentInfo.star_dem}"></td>
								<td><div class="Validform_checktip"></div></td>
							</tr>
							<tr>
								<td class="td_right">巡检星级:</td>
								<td><input type="text" class="textarea" datatype="n"   style="width:200px;height:20px;" name="star_mai" value="${studentInfo.star_mai}"></td>
								<td><div class="Validform_checktip"></div></td>
							</tr>
							<tr>
								<td class="td_right">故障处理星级:</td>
								<td><input type="text" class="textarea" datatype="n"  style="width:200px;height:20px;" name="star_dea" value="${studentInfo.star_dea}"></td>
								<td><div class="Validform_checktip"></div></td>
							</tr>
							<tr>
								<td class="td_right">检修星级:</td>
								<td><input type="text" class="textarea" datatype="n"  style="width:200px;height:20px;" name="star_ove" value="${studentInfo.star_ove}"></td>
								<td><div class="Validform_checktip"></div></td>
							</tr>
							<tr>
								<td class="td_right">等级:</td>
								<td><input type="text" class="textarea" datatype="n"  style="width:200px;height:20px;" name="star_grade" value="${studentInfo.stu_grade}"></td>
								<td><div class="Validform_checktip"></div></td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>

		<div class="box_border">
			<div class="box_top">
				<b class="pl15">操作栏</b>
			</div>
			<div class="box_center">
				<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="td_right">&nbsp;</td>
						<td class=""><input type="button" value="保存" id="btnSave" class="btn btn82 btn_save2" onclick="btnSaveClick()"> 
							<input	type="button" name="button" class="btn btn82 btn_res" value="返回" onclick="history.go(-1)" /></td>
					</tr>
				</table>
			</div>
		</div>

	</div>

	<script type="text/javascript">
	         
	   $("#StudentInfoForm").Validform({
          tiptype:2
         }); 

          $("#stu_head").uploadify({
                height: 30,
                swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/StudentInfoManage/UpImgFile',
                buttonText: '上传头像图片',
                width: 120,fileObjName:'file',
                fileTypeExts:'*.jpg;*.png;*.gif',multi: true,
                onUploadSuccess: function (file, data, response) {
                	if(data.split("|")[0]=="0"){
                		alert("头像上传失败!");
                		return;
                		}else{
		                    $("#pic").attr('src','${pageContext.request.contextPath}/' + data.split("|")[1]);
		                    $("#pic").css("display","block");
							$("#stu_pic").val(data.split("|")[1]);
				}
			}
		});
		
		function btnSaveClick(){
			$.post('${pageContext.request.contextPath}/Teacher/StudentUpdate',$("#StudentInfoForm").serialize(),function(data){
				if(data.split("|")[0]=="0"){
					alert(data.split("|")[1]);					
				}else{
					alert("学生信息修改成功!");
					location.href='${pageContext.request.contextPath}/'+data.split("|")[1];
				}
					
			});
	}
	
		parent.window.setLocation("学生管理--信息管理--信息维护");
	</script>
</body>
</html>
