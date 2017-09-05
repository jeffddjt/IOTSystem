<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

  </head>
  
  <body>
            <div class="container">
  
          <div id="forms" class="mt10">
					<div class="box_border" id="ResourceInfoAdd">
		          			<div class="box_top"><b class="pl15">新增学生</b></div>
		          			<div class="box_center">
                        	<form id="ResourceInfoForm" class="resourceInfoForm" action="Teacher/ResourceInfoAdd" method="post">   
		          					<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
		          						<tr>
		          							<td class="td_right" style="vertical-align: top">导入学生信息：</td>
		          							<td class="res_path_file">
		          								<div style="float" ><input type="file" id="upResourceVRPFile" type="file" name="file" class="input-text lh30" size="30"></div>
		          								<input type="hidden" id="upResourceVRPPath" name="resVrp">
		          							</td>
		          							<td><div class="Validform_checktip"></div></td> 
		          						</tr>
		          						<tr>
		          							<td class="td_right" style="vertical-align: top;">Excel文档格式：</td>
		          							<td><img src="<%=path %>/assets/images/excel.png" alt=""  width="312" height="127"></td>
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
       $(function(){
       
           $(".resourceInfoForm").Validform({
          tiptype:2
         });     
         
            $("#upResourceVRPFile").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
                uploader: '${pageContext.request.contextPath}/Teacher/StudentManage/UpExcelFile',buttonText: '上传Excel文档',width: 120,fileObjName:'file',fileTypeExts:'*.xls',multi: true,
                onUploadSuccess: function (file, data, response) {
                    setUpVRPSuccess("upResourceVRPFile","upResourceVRPPath", data);
                }
            });
            
            
           function setUpVRPSuccess(id,pathID,data){
              $("#" + id).parent().parent(".res_path_file").append(" <div style='color:red;margin:0 30px;float:left' class='upfile_msg'>" + data.split('|')[1] + "</div>");
              if(data.split("|")[0]=="1"){
              	  $("#"+id).parent().parent(".res_path_file").append("<div>"+data.split("|")[2]+"</div>");
                  $("#"+pathID).val(data.split("|")[2]);
              }
           } 
         
       });

        $("#selector").val('${categoryId}');

		
 		function btnSaveClick(){
		$.post("${pageContext.request.contextPath}/Teacher/StudentInfoAdd",$("#ResourceInfoForm").serialize(),
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

        parent.window.setLocation("${subject} - ${category}设置--新增资源");
    </script>
  </body>
</html>
