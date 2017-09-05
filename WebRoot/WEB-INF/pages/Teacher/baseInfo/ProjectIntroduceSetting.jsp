<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/validate.css"/>
          <link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
     <script type="text/javascript" src="<%=path %>/assets/js/Validform_v5.3.2.js"></script>     
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>    
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>
    <script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script> 

  </head>
  
  <body>
        <div class="container">
        <div id="forms" class="mt10">

            <div class="box">
                <div class="box_border">
                    <div class="box_top"><b class="pl15">项目介绍</b></div>
                    <div class="box_center">
                        <form id="form1" action="${pageContext.request.contextPath}/Teacher/ProjectInfoUpdate" method="post">
                            <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right">标题：</td>
                                    <td class="">
                                        <div style="float: left">
                                            <input type="text" id="TitleInfo" name="title" class="input-text lh30" size="70" value="${projectInfo.title }"/>
                                        </div>
                                        <div id="CorTtilesTip" style="float: left"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_right" style="vertical-align: top">文本内容：</td>
                                    <td class="">
                                        <div style="float: left">
                                        <textarea id="editor" rows="50" cols="50" style="width:1024px;height:500px;" name="text">${projectInfo.text }</textarea>
                                        <input type="hidden" name="id" value="${projectInfo.id }">
                                        <input type="hidden" name="createTime" value="${projectInfo.createTime}">
                                        <input type="hidden" name="lastUpdateTime" value="${projectInfo.lastUpdateTime }">
                                        </div>
                                        <div id="ContentTip" style="float: left"></div>
                                    </td>
                                </tr>
                            </table>

                            <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right">&nbsp;</td>
                                    <td class="">
                                    	<input type="button" value="保存" class="btn btn82 btn_res" onclick="btnSave()"/>

                                    </td>
                                </tr>
                            </table>
                             </form>                       
                    </div>
                </div>
                <div class="box_border">
                    <div class="box_center">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
		
		
		var editor=CKEDITOR.replace("editor");

        

        function btnSave() {
			$("#editor").val(editor.getData());  
             $.post("${pageContext.request.contextPath}/Teacher/ProjectInfoUpdate",$("#form1").serialize(),function(data){
			 if(data.split("|")[0]=="0")
			 		alert(data.split("|")[1]);
			 	else{
			 		alert("保存成功！");
			 		location.href="${pageContext.request.contextPath}/"+data.splist("|")[1];
			 	}
            });
        }



        parent.window.setLocation("基础信息--项目介绍设置");
    </script>
  </body>
</html>
