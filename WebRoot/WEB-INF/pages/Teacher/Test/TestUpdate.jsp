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
     <link rel="stylesheet" href="<%=path %>/assets/css/common.css"/>
     <link rel="stylesheet" href="<%=path %>/assets/css/main.css"/>
     <link rel="stylesheet" href="<%=path %>/assets/css/style.css"/>
     <link rel="stylesheet" href="<%=path %>/assets/css/validate.css"/>
     <script type="text/javascript" src="<%=path%>/assets/js/jquery.min.js"></script>
     <script type="text/javascript" src="<%=path %>/assets/js/Validform_v5.3.2.js"></script>     
    <script type="text/javascript" src="<%=path%>/assets/js/jquery.SuperSlide.js"></script>    
    <script type="text/javascript" src="<%=path%>/assets/js/navSlide.js">  </script>
	<style>
		.questionItem {color:black;display:block;height:100%;width:100%;}
		.questionItem:hover{color:red;background:none;}
		
		.tr:hover{background:#eee;}
	</style>
  </head>
  
  <body>
        <div class="container">
  
          <div id="forms" class="mt10">
					<div class="box_border" id="TestAdd">
		          			<div class="box_top"><b class="pl15">修改考试</b></div>
		          			<div class="box_center">
                        	<form id="TestForm" class="testForm" action="Teacher/TestAdd" method="post">   
		          					<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
		          						<tr>
		          							<td class="td_right" width="250">名称：</td>
		          							<td style="width:300px;">
		          							<input type="text"  id="testName" name="testName" value="${test.testName}" datatype="*" nullmsg="必须输入名称！"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td>
		          							
		          						</tr>
		          						<tr>
		          							<td class="td_right">单选题数量：</td>
		          							<td><input type="text"  id="SingleQuestionCount" name="singleQuestionCount"  value="${test.singleQuestionCount}" datatype="n" errormsg="数量只能是数字!"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td>
		          							 
		          						</tr>
		          						<tr>
		          							<td class="td_right">多选题数量：</td>
		          							<td><input type="text"  id="MultipleQuestionCount" name="multipleQuestionCount" value="${test.multipleQuestionCount }" datatype="n" errormsg="数量只能是数字!"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td>
		          							 
		          						</tr>
		          						<tr>
		          							<td class="td_right">判断题数量：</td>
		          							<td><input type="text"  id="WhetherQuestionCount" name="whetherQuestionCount" value="${test.whetherQuestionCount}"  datatype="n"  errormsg="数量只能是数字!"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td>
		          							 
		          						</tr>
		          						<tr>
		          							<td class="td_right">VRP虚拟化题数量：</td>
		          							<td><input type="text"  id="VRPQuestionCount" name="vrpQuestionCount" value="${test.vrpQuestionCount }" datatype="n" errormsg="数量只能是数字!"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td> 
		          						</tr>
		          						<tr>
		          							<td class="td_right">考试时间(分钟)：</td>
		          							<td><input type="text"  id="Duration" name="duration"  value="${test.duration }" datatype="n" errormsg="考试时间只能是数字!"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td> 
		          						</tr>
		          						<tr>
		          							<td class="td_right">经验值：</td>
		          							<td><input type="text"  id="Experience" name="experience" value="${test.experience}" datatype="n" errormsg="经验值只能是数字!"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td> 
		          						</tr>
		          						<tr>
			          						<td class="td_right">是否计算经验值：</td>
		          							<td>
		          								<input type="checkbox"  id="isExperience" style="width:20px;height:20px;border:1px solid #eee;"  >
		          								<input type="hidden"  id="isExperienceValue" name="exp" value="false">
		          								<input type="hidden" name="subject" value="${test.subject }">
		          								<input type="hidden" name="category" value="${test.category }">
		          								<input type="hidden" name="id" value="${test.id }">
		          							</td> 
		          							
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
       
           $(".testForm").Validform({
          tiptype:2
         });     
         
       });

		$("#isExperience").prop({checked:${test.exp}});
		$("#isExperienceValue").val(${test.exp});

		$("#isExperience").change(function(){
			var isExperience=$(this).prop("checked");
			$("#isExperienceValue").val(isExperience);
		});
		
 		function btnSaveClick(){
		$.post("Teacher/TestUpdate",$("#TestForm").serialize(),
			function(data){											
						if (data.split("|")[0] != "0"){
							alert("修改成功！");
							self.location.href=data.split("|")[1];
							}
						else
							alert(data.split("|")[1]);
			});	
			return true;
		} 

        parent.window.setLocation("${subject} - ${category}测试设置--修改");
    </script>
  </body>
</html>