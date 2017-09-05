<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
        <link href="${pageContext.request.contextPath}/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>
	<style>
		.questionItem {color:black;display:block;height:100%;width:100%;}
		.questionItem:hover{color:red;background:none;}
		
		.tr:hover{background:#eee;}
		p{display:inline;}
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
	
	#counter{top:0;right:0;color:red;width:200px;height:30px;position: fixed;line-height:30px;text-align:center;}
	.Questionbox{margin-top:30px;}

	</style>

  </head>
  
  <body>
           <div class="Questionbox">  
           <c:forEach items="${examPaperDetailList}" var="question">
		          			<input type="hidden" id="questionType" value="${question.question.type}">
		          			<c:if test="${question.question.type eq '1' }">
							<form id="form1">		          			
		          			<div class="box_center">
		          					<div style="width:800px;">
		          						<div style="margin:10px;">
		          							${question.questionNo}.${question.question.itemText}
		          						</div>
										<ul class="answer_list">
											<li>
											<img width="230" height="230" src="${pageContext.request.contextPath}/${question.question.choiceA1}">
											<span>A.</span>
											</li>
											<li>
											<img width="230" height="230" src="${pageContext.request.contextPath}/${question.question.choiceB1}">
											<span>B.</span>
											</li>
											<li>
											<img width="230" height="230" src="${pageContext.request.contextPath}/${question.question.choiceC1}">
											<span>C.</span>
											</li>
											<li>
											<img width="230" height="230" src="${pageContext.request.contextPath}/${question.question.choiceD1}">
											<span>D.</span>
											</li>
										</ul>
										
		          					</div>
		          			</div>
		
		          			<div class="box_bottom" style="clear:both;">
		          				<b class="pl15">正确答案：${question.answer1}&nbsp;&nbsp;&nbsp;&nbsp;考生答案：</b>
		          				<c:if test="${question.stu_answer1 eq question.answer1 }">
		          				<b class="pl15" style="color:#00f;">${question.stu_answer1}</b>
		          				</c:if>		          				
		          				<c:if test="${!(question.stu_answer1 eq question.answer1) }">
		          				<b class="pl15" style="color:#f00;">${question.stu_answer1}</b>
		          				</c:if>		          				
							</div>
							</form>
							</c:if>
							
							<c:if test="${question.question.type eq '2' }">
							<form id="form2">		          			
		          			<div class="box_center">
		          					<div style="width:800px;">
		          						<div style="margin:10px;width:360px;float:left;height:400px;">
		          							${question.questionNo}.${question.question.itemText}
		          						<ul>
		          							<li style="margin:10px;">A.${question.question.choiceA1}</li>
		          							<li style="margin:10px;">B.${question.question.choiceB1}</li>
		          							<li style="margin:10px;">C.${question.question.choiceC1}</li>
		          							<li style="margin:10px;">D.${question.question.choiceD1}</li>
		          						</ul>
		          						</div>
										<div style="width:360px;height:400px;float:right;">
											<img width="360" height="360" style="margin:10px auto;" src="${pageContext.request.contextPath}/${question.question.itemRes}">
										</div>
		          					</div>
		          			</div>
		
		          			<div class="box_bottom" style="clear:both;">
		          				<b class="pl15">正确答案：${question.answer1}&nbsp;&nbsp;&nbsp;&nbsp;考生答案：</b>
		          				<c:if test="${question.stu_answer1 eq question.answer1 }">
		          				<b class="pl15" style="color:#00f;">${question.stu_answer1}</b>
		          				</c:if>		          				
		          				<c:if test="${!(question.stu_answer1 eq question.answer1) }">
		          				<b class="pl15" style="color:#f00;">${question.stu_answer1}</b>
		          				</c:if>		          				

		          		</div>							
							</form>						

							</c:if>
							
							<c:if test="${question.question.type eq '3' }">

							<form id="form3">		          			
		          			<div class="box_center">
		          					<div style="width:800px;">
		          						<div style="margin:10px;">
		          							${question.questionNo}.${question.question.itemText}
		          						</div>
		          						<div style="margin:10px;">(1)选择满足要求的器材名称：</div>
		          						<ul>
		          							<li style="margin:10px;">A.${question.question.choiceA1}</li>
		          							<li style="margin:10px;">B.${question.question.choiceB1}</li>
		          							<li style="margin:10px;">C.${question.question.choiceC1}</li>
		          							<li style="margin:10px;">D.${question.question.choiceD1}</li>
		          						</ul>
		          					</div>
		          			</div>
		
		          			<div class="box_bottom" style="clear:both;">
		          				<b class="pl15">正确答案：${question.answer1}&nbsp;&nbsp;&nbsp;&nbsp;考生答案：</b>
		          				<c:if test="${question.stu_answer1 eq question.answer1 }">
		          				<b class="pl15" style="color:#00f;">${question.stu_answer1}</b>
		          				</c:if>		          				
		          				<c:if test="${!(question.stu_answer1 eq question.answer1) }">
		          				<b class="pl15" style="color:#f00;">${question.stu_answer1}</b>
		          				</c:if>		          				

		          		</div>		
		          		<div class="box_center">
		          					<div style="width:800px;">
		          						<div style="margin:10px;">(2)选择满足要求的器材图片：</div>
		          						<ul style="margin:0 auto;">
		          							<li style="text-align:center;"><img width="160" height="160" src="${question.question.choiceA2}"><span style="display:block;">A.</span></li>
		          							<li style="text-align:center;"><img width="160" height="160" src="${question.question.choiceB2}"><span style="display:block;">B.</span></li>
		          							<li style="text-align:center;"><img width="160" height="160" src="${question.question.choiceC2}"><span style="display:block;">C.</span></li>
		          							<li style="text-align:center;"><img width="160" height="160" src="${question.question.choiceD2}"><span style="display:block;">D.</span></li>
		          						</ul>	
		          					 </div>		
		          		</div>	
		          			<div class="box_bottom" style="clear:both;">
		          				<b class="pl15">正确答案：${question.answer2}&nbsp;&nbsp;&nbsp;&nbsp;考生答案：</b>
		          				<c:if test="${question.stu_answer2 eq question.answer2 }">
		          				<b class="pl15" style="color:#00f;">${question.stu_answer2}</b>
		          				</c:if>		          				
		          				<c:if test="${!(question.stu_answer2 eq question.answer2) }">
		          				<b class="pl15" style="color:#f00;">${question.stu_answer2}</b>
		          				</c:if>		          				

		          		</div>			
					  </form>							
					   </c:if>
									 
						<c:if test="${question.question.type eq '4' }">         			
							<form id="form4">		          			
		          			<div class="box_center">
		          					<div style="width:800px;">
		          						<div style="margin:10px;">
		          							${question.questionNo}.${question.question.itemText}
		          						</div>
		          						<ul>
		          							<li style="margin:10px;">A.${question.question.choiceA1}</li>
		          							<li style="margin:10px;">B.${question.question.choiceB1}</li>
		          							<li style="margin:10px;">C.${question.question.choiceC1}</li>
		          							<li style="margin:10px;">D.${question.question.choiceD1}</li>
		          						</ul>
		          					</div>
		          			</div>
		
		          			<div class="box_bottom" style="clear:both;">
		          				<b class="pl15">正确答案：${question.answer1}&nbsp;&nbsp;&nbsp;&nbsp;考生答案：</b>
		          				<c:if test="${question.stu_answer1 eq question.answer1 }">
		          				<b class="pl15" style="color:#00f;">${question.stu_answer1}</b>
		          				</c:if>		          				
		          				<c:if test="${!(question.stu_answer1 eq question.answer1) }">
		          				<b class="pl15" style="color:#f00;">${question.stu_answer1}</b>
		          				</c:if>		          				
	          				
		          		</div>							
						</form>
						</c:if>
			</c:forEach>
           </div>

  </body>
</html>
