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
					<div class="box_border" id="ExamAdd">
		          			<div class="box_top"><b class="pl15">修改考试</b></div>
		          			<div class="box_center">
                        	<form id="ExamForm" class="examForm" action="Teacher/ExamAdd" method="post">   
		          					<table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
		          						<tr>
		          							<td class="td_right" width="250">名称：</td>
		          							<td style="width:300px;">
		          							<input type="text"  id="examName" name="examName" value="${exam.examName}" datatype="*" nullmsg="必须输入名称！"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td>
		          							
		          						</tr>
		          						<tr>
		          							<td class="td_right">题目数量：</td>
		          							<td><input type="text"  id="SingleQuestionCount" name="qty"  value="${exam.qty}" datatype="n" errormsg="数量只能是数字!"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td>
		          							 
		          						</tr>
		          						<tr>
		          							<td class="td_right">考试时间(分钟)：</td>
		          							<td><input type="text"  id="Duration" name="duration"  value="${exam.duration }" datatype="n" errormsg="考试时间只能是数字!"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td> 
		          						</tr>
		          						<tr>
		          							<td class="td_right">总成绩：</td>
		          							<td><input type="text" id="score" name="score" value="${exam.score}" datetype="n" errror="必须是数字!" style="width:300px;height:20px;border:1px solid #eee;"></td>
		          						</tr>
		          						<tr>
		          							<td class="td_right">经验值：</td>
		          							<td><input type="text"  id="Experience" name="experience" value="${exam.experience}" datatype="n" errormsg="经验值只能是数字!"  style="width:300px;height:20px;border:1px solid #eee;"  ></td>
		          							<td><div class="Validform_checktip"></div></td> 
		          						</tr>
		          						<tr>
			          						<td class="td_right">是否计算经验值：</td>
		          							<td>
		          								<input type="checkbox"  id="isExperience" style="width:20px;height:20px;border:1px solid #eee;"  >
		          								<input type="hidden"  id="isExperienceValue" name="exp" value="false">
		          								<input type="hidden" name="subject" value="${exam.subject }">
		          								<input type="hidden" name="category" value="${exam.category }">
		          								<input type="hidden" name="id" value="${exam.id }">
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
       
           $(".examForm").Validform({
          tiptype:2
         });     
         
       });

		$("#isExperience").prop({checked:${exam.exp}});
		$("#isExperienceValue").val(${exam.exp});

		$("#isExperience").change(function(){
			var isExperience=$(this).prop("checked");
			$("#isExperienceValue").val(isExperience);
		});
		
 		function btnSaveClick(){
		$.post("Teacher/ExamUpdate",$("#ExamForm").serialize(),
			function(data){											
						if (data.split("|")[0] != "0"){
							alert("修改成功！");
							self.location.href="${pageContext.request.contextPath}/"+data.split("|")[1];
							}
						else
							alert(data.split("|")[1]);
			});	
			return true;
		} 

        parent.window.setLocation("${subject} - ${category}考核设置--修改");
    </script>
  </body>
</html>