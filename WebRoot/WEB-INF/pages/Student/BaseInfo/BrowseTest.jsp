<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="bh" uri="http://www.bohechina.com/tag-html" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="pragma" content="no-cache"> 
	<meta http-equiv="cache-control" content="no-cache"> 
	<meta http-equiv="expires" content="0">  
     <title>仪表工在线顶岗实训系统</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
        <link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>
	<style>
		.questionItem {color:black;display:block;height:100%;width:100%;}
		.questionItem:hover{color:red;background:none;}
		
		.tr:hover{background:#eee;}
		#msgboxcon{width:100%;height:100%;background:rgba(255,255,255,0.5);position:absolute;left:0;top:0;display:none;}
		#msgbox{
			width:300px;
			height:100px;
			background:#eee;
			border:1px solid #ccc;
			box-shadow:10px 10px 10px #ccc;
			position: absolute;
			left:50%;
			top:50%;
			margin-top:-50px;
			margin-left:-150px;
			text-align: center;
			line-height: 100px;
		}
		.answer_list {margin:20px auto;}
		.answer_list li{float:left;width:400px;height:233px;text-align:center;margin:20px auto;}
		.answer_list li span{display:block;}
		#form3 ul li {float:left;margin:10px 10px;}
		.box_bottom li {float:left;}
		.box_bottom ul li a{color: black;width: 50px;height:50px; diaplay:block;text-align:center;margin:10px;}
		p{display:inline;}
	</style>

  </head>
  
  <body>
   <div class="container">
          <div id="forms" class="mt10">
					<div class="box_border" id="ResourceInfoAdd">					
		          			<div class="box_top"><b class="pl15">${subjectInfo.subject}训练题</b></div>
		          			<c:forEach items="${questionList}" var="question">
		          			<input type="hidden" id="questionType" value="${question.type}">
		          			<c:if test="${question.type eq '1' }">
							<form id="form1">		          			
		          			<div class="box_center">
		          					<div style="min-width:800px;">
		          						<div style="margin:10px;">
		          							${pageNo}.${question.itemText}
		          						</div>
										<ul class="answer_list">
											<li>
											<img width="230" height="230" src="${pageContext.request.contextPath}/${question.choiceA1}">
											<span>A.</span>
											</li>
											<li>
											<img width="230" height="230" src="${pageContext.request.contextPath}/${question.choiceB1}">
											<span>B.</span>
											</li>
											<li>
											<img width="230" height="230" src="${pageContext.request.contextPath}/${question.choiceC1}">
											<span>C.</span>
											</li>
											<li>
											<img width="230" height="230" src="${pageContext.request.contextPath}/${question.choiceD1}">
											<span>D.</span>
											</li>
										</ul>
										
		          					</div>
		          			</div>
		
		          			<div class="box_bottom" style="clear:both;">
		          				<b class="pl15">选择答案：</b>
		          				<label><input type="radio" name="answer1"  value="A">A</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="B">B</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="C">C</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="D">D</label>&nbsp;&nbsp;
		          				<input type="button" value="答案提示" onclick="displayAnswer1('${question.id}')" style="width:70px;height:30px;">&nbsp;&nbsp;
		          				<span id="form1Answer1"></span>
		          				<div style="float:right;width:400px;height:100%;line-height:50px;text-align:right;">
		          					<bh:BHPager pageNo="${pageNo}" url="${pageContext.request.contextPath}/Student/Test?subject=${subjectInfo.id}" pageCount="${pageCount}"/>
		          				</div>
		          		</div>							
							</form>
							</c:if>
							
							<c:if test="${question.type eq '2' }">
							<form id="form2">		          			
		          			<div class="box_center">
		          					<div style="min-width:800px;">
		          						<div style="margin:10px;width:360px;float:left;height:400px;">
		          							${pageNo}.${question.itemText}
		          						<ul>
		          							<li style="margin:10px;">A.${question.choiceA1}</li>
		          							<li style="margin:10px;">B.${question.choiceB1}</li>
		          							<li style="margin:10px;">C.${question.choiceC1}</li>
		          							<li style="margin:10px;">D.${question.choiceD1}</li>
		          						</ul>
		          						</div>
										<div style="width:360px;height:400px;float:right;margin-right:50px;">
											<img width="360" height="360" style="margin:10px auto;" src="${pageContext.request.contextPath}/${question.itemRes}">
										</div>
		          					</div>
		          			</div>
		
		          			<div class="box_bottom" style="clear:both;">
		          				<b class="pl15">选择答案：</b>
		          				<label><input type="radio" name="answer1"  value="A">A</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="B">B</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="C">C</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="D">D</label>&nbsp;&nbsp;
		          				<input type="button" value="答案提示" onclick="displayAnswer1('${question.id}')" style="width:70px;height:30px;">&nbsp;&nbsp;
		          				<span id="form2Answer1"></span>
		          				<div style="float:right;width:400px;height:100%;line-height:50px;text-align:right;">
		          					<bh:BHPager pageNo="${pageNo}" url="${pageContext.request.contextPath}/Student/Test?subject=${subjectInfo.id}" pageCount="${pageCount}"/>
		          				</div>
		          		</div>							
							</form>
							</c:if>
													
							<c:if test="${question.type eq '3' }">
							<form id="form3">		          			
		          			<div class="box_center">
		          					<div style="min-width:800px;">
		          						<div style="margin:10px;">
		          							${pageNo}.${question.itemText}
		          						</div>
		          						<div style="margin:10px;">(1)选择满足要求的器材名称：</div>
		          						<ul>
		          							<li style="margin:10px;">A.${question.choiceA1}</li>
		          							<li style="margin:10px;">B.${question.choiceB1}</li>
		          							<li style="margin:10px;">C.${question.choiceC1}</li>
		          							<li style="margin:10px;">D.${question.choiceD1}</li>
		          						</ul>
		          					</div>
		          			</div>
		
		          			<div class="box_bottom" style="clear:both;">
		          				<b class="pl15">选择答案：</b>
		          				<label><input type="radio" name="answer1"  value="A">A</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="B">B</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="C">C</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="D">D</label>&nbsp;&nbsp;
		          				<input type="button" value="答案提示" onclick="displayAnswer1('${question.id}')" style="width:70px;height:30px;">&nbsp;&nbsp;
		          				<span id="form3Answer1"></span>
		          		</div>		
		          		<div class="box_center">
		          					<div style="min-width:800px;">
		          						<div style="margin:10px;">(2)选择满足要求的器材图片：</div>
		          						<ul style="margin:0 auto;">
		          							<li style="text-align:center;"><img width="160" height="160" src="${question.choiceA2}"><span style="display:block;">A.</span></li>
		          							<li style="text-align:center;"><img width="160" height="160" src="${question.choiceB2}"><span style="display:block;">B.</span></li>
		          							<li style="text-align:center;"><img width="160" height="160" src="${question.choiceC2}"><span style="display:block;">C.</span></li>
		          							<li style="text-align:center;"><img width="160" height="160" src="${question.choiceD2}"><span style="display:block;">D.</span></li>
		          						</ul>	
		          					 </div>		
		          		</div>	
		          			<div class="box_bottom" style="clear:both;">
		          				<b class="pl15">选择答案：</b>
		          				<label><input type="radio" name="answer1"  value="A">A</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="B">B</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="C">C</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="D">D</label>&nbsp;&nbsp;
		          				<input type="button" value="答案提示" onclick="displayAnswer2('${question.id}')" style="width:70px;height:30px;">&nbsp;&nbsp;
		          				<span id="form3Answer2"></span>
		          				<div style="float:right;width:400px;height:100%;line-height:50px;text-align:right;">
		          					<bh:BHPager pageNo="${pageNo}" url="${pageContext.request.contextPath}/Student/Test?subject=${subjectInfo.id}" pageCount="${pageCount}"/>
		          				</div>
		          		</div>			
					  </form>							
						</c:if>
						
						<c:if test="${question.type eq '4'}">		          			
							<form id="form4">		          			
		          			<div class="box_center">
		          					<div style="min-width:800px;">
		          						<div style="margin:10px;">
		          							${pageNo}.${question.itemText}
		          						</div>
		          						<ul>
		          							<li style="margin:10px;">A.${question.choiceA1}</li>
		          							<li style="margin:10px;">B.${question.choiceB1}</li>
		          							<li style="margin:10px;">C.${question.choiceC1}</li>
		          							<li style="margin:10px;">D.${question.choiceD1}</li>
		          						</ul>
		          					</div>
		          			</div>
		
		          			<div class="box_bottom">
		          				<b class="pl15">选择答案：</b>
		          				<label><input type="radio" name="answer1"  value="A">A</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="B">B</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="C">C</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="D">D</label>&nbsp;&nbsp;
		          				<input type="button" value="答案提示" onclick="displayAnswer1('${question.id}')" style="width:70px;height:30px;">&nbsp;&nbsp;
		          				<span id="form4Answer1"></span>
		          				<div style="float:right;width:400px;height:100%;line-height:50px;text-align:right;">
		          					<bh:BHPager pageNo="${pageNo}" url="${pageContext.request.contextPath}/Student/Test?subject=${subjectInfo.id}" pageCount="${pageCount}"/>
		          				</div>
		          				
		          		</div>							
							</form>
							</c:if>
		          		</c:forEach>
		          </div>
		  </div>


   </div>
   <script type="text/javascript">
       var questionType=$("#questionType").val();
		
		function displayAnswer1(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/Student/GetQuestionAnswer",
				type:"post",
				data:{
						"id":id,
						"answer":1
					},
				success:function(data){
					$("#form"+questionType+"Answer1").text(data.split("|")[1]);
				}
			});
			
		}
		
		function displayAnswer2(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/Student/GetQuestionAnswer",
				type:"post",
				data:{
						"id":id,
						"answer":2
					},
				success:function(data){
					$("#form"+questionType+"Answer2").text(data.split("|")[1]);
				}
			});
			
		}
		
		parent.window.setLocation("${subjectInfo.subject}--训练")
   </script>
  </body>
</html>
