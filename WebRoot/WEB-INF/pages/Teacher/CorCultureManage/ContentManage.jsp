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

            <div class="box">
                <div class="box_border">
                    <div class="box_top"><b class="pl15">内容管理</b></div>
                    <div class="box_center">
                        <form id="form1" >
                            <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="td_right">标题：</td>
                                    <td class="">
                                        <div style="float: left">
                                            <input type="text" id="TitleInfo" name="title" class="input-text lh30" size="70" value="${corCulture.title }"/>
                                        </div>
                                        <div id="CorTtilesTip" style="float: left"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_right" style="vertical-align: top">文本内容：</td>
                                    <td class="">
                                        <div style="float: left">
                                        <textarea rows="40" cols="150" id="editor" style="width:1024px;height:500px;">${corCulture.content }</textarea>
                                        <input type="hidden" id="content" name="content"  value="${corCulture.content }"/>
                                        <input type="hidden" name="id" value="${corCulture.id }">
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
            
            $("#content").val(editor.getData());
            
            $.post("Teacher/CorCultureManage/ContentManage",$("#form1").serialize(),function(data){
            	if(data.split("|")[0]!="0"){
            		alert("保存成功！");
            		window.location.href="${pageContext.request.contextPath}"+data.split("|")[1];
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


        parent.window.setLocation("企业文化--内容管理");
    </script>
  </body>
  </html>
