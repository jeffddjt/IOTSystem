<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
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
     <script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>

  </head>
  
  <body>
        <div class="container">
    <div id="forms" class="mt10">
        
            <div class="box">
                <div class="box_border">
                    <div class="box_top"><b class="pl15">操作手册设置</b></div>
                    <div class="box_center">
                        <form id="form1"  >
                            <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right">上一次更新时间：</td>
                                    <td class="">
                                        <div style="float:left" id="LastUpTime" name="LastUpTime" >
                                        <fmt:formatDate value="${operationDoc.lastUpdateTime }" pattern="yyyy/MM/dd HH:mm:ss"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_right">上传新文件：</td>
                                    <td class="">
                                        <div style="float:left">
                                        	<input type="file" name="file" id="Files" class="input-text lh30" size="80">
                                        	<input type="hidden" id="fileName" name="fileName" value="${operationDoc.fileName}">
                                        	<input type="hidden" name="id" value="${operationDoc.id}">
                                        </div>
                                        <div id="FileTip" style="float:left"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_right">&nbsp;</td>
                                    <td class="">
                                    <input type="button" value="保存" class="btn btn82 btn_save2"  onclick="btnSaveClick()"/>
                                    </td>
                                </tr>
                           </table>
                        </form>
                    </div>
                </div>
                <div class="box_border">
                    <div class="box_top"><b class="pl15">当前操作手册预览</b></div>
                    <div class="box_center">
                        <iframe id="DocPreview" style="width:100%;height:600px;border:none;" src="${pageContext.request.contextPath}/${operationDoc.fileName}"></iframe>
                     </div>
                </div>
            </div>
        </div>
    </div>
        <script type="text/javascript">
            $("#Files").uploadify({height: 30,swf: '${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.swf',
               uploader: '${pageContext.request.contextPath}/Teacher/OperationDocSetting/UpFile',buttonText: '上传操作手册',width: 120,fileObjName:'file',fileTypeExts:'*.pdf',multi: true,
               onUploadSuccess: function (file, data, response) {
                	$("#fileName").val(data.split("|")[2]);   
               }
           });
           
       function btnSaveClick(){
		$.post("${pageContext.request.contextPath}/Teacher/OperationDocUpdate",$("#form1").serialize(),
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
        parent.window.setLocation("基础信息--操作手册设置");
    </script>
  </body>
</html>
