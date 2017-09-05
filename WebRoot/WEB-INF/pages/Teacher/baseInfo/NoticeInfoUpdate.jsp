<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    
     <title>仪表工在线顶岗实训系统</title>
     <link rel="stylesheet" href="<%=path %>/assets/css/common.css"/> 
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
          <link rel="stylesheet" href="<%=path %>/assets/css/main.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>
    <link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/assets/js/uploadfy/jquery.uploadify.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script>


  </head>
  
  <body>
        <div class="container">
    <div id="forms" class="mt10">
        <form id="form1">
            <div class="box">
                <div class="box_border">
                    <div class="box_top"><b class="pl15">修改通知</b></div>
                    <div class="box_center">
                            <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right">标题：</td>
                                    <td class="">
                                        <div style="float:left"><input type="text" id="title" name="title" class="input-text lh30" size="70"  value="${noticeInfo.title }"/></div>
                                        <div id="CorTtilesTip" style="float:left"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_right" style="vertical-align:top">文本内容：</td>
                                    <td class="">
                                        <div style="float:left">
                                        <!-- 
                                        <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
                                         -->
                                        <textarea id="editor" rows="50" cols="50" style="width:1024px;height:500px;">${noticeInfo.content }</textarea>
                                        <input type="hidden" id="content" name="content"  value="${noticeInfo.content }"/>
                                        <input type="hidden" name="id" value="${noticeInfo.id }">
                                        <input type="hidden" name="createTime" value="${noticeInfo.createTime }">
                                        </div>
                                        <div id="ContentTip" style="float:left"></div>
                                    </td>
                                </tr>
                            </table>
                    </div>
                </div>
                <div class="box_border">
                    <div class="box_top"><b class="pl15">操作栏</b></div>
                    <div class="box_center">
                            <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right">&nbsp;</td>
                                    <td class="">

                                        <input type="button" name="ok" value="保存" class="btn btn82 btn_save2" onclick="return btnSave()">
                                        <input type="button" name="button" class="btn btn82 btn_res" value="返回" onclick="location.href = 'javascript:history.go(-1)'"/>
                                    </td>
                                </tr>
                            </table>
                    </div>
                </div>
            </div>
        </form>
        </div>
    </div>


    <script type="text/javascript">
        var editor=CKEDITOR.replace("editor");
        
        function btnSave()
        {
            $("#content").val(editor.getData());
            
            $.post('${pageContext.request.contextPath}/Teacher/NoticeInfoUpdate',$("#form1").serialize(),function(data){
            	if(data.split("|")[0]!="0"){
            		alert("保存成功！");
            		window.location.href="${pageContext.request.contextPath}/"+data.split("|")[[1]];
            	}
            	else
            	{
            		alert(data.split("|")[1]);
            	}
            });
            return true;
        }

        $(function () {
        });

        parent.window.setLocation("基础信息 -- 通知管理 -- 修改通知");
    </script>
  </body>
</html>

