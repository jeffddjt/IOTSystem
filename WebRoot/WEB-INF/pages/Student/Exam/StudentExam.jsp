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
    
     <title>仪表工在线顶岗实训系统--${subjectInfo.subject}--${examName}</title>
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
	.Questionbox{margin-top:30px;margin-bottom:50px;}

	</style>

  </head>
  
  <body>
            <div id="counter">剩余时间：<span id="timer"></span></div>
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
		          				<b class="pl15">选择答案：</b>
		          				<label><input type="radio" name="answer1"  value="A">A</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="B">B</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="C">C</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="D">D</label>&nbsp;&nbsp;
		          				<input type="hidden" name="questionNo" value="${question.questionNo}">
		          				<input type="hidden" name="examPaperId" value="${examPaperId}">
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
		          				<b class="pl15">选择答案：</b>
		          				<label><input type="radio" name="answer1"  value="A">A</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="B">B</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="C">C</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="D">D</label>&nbsp;&nbsp;
		          				<input type="hidden" name="questionNo" value="${question.questionNo}">
		          				<input type="hidden" name="examPaperId" value="${examPaperId}">
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
		          				<b class="pl15">选择答案：</b>
		          				<label><input type="radio" name="answer1"  value="A">A</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="B">B</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="C">C</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="D">D</label>&nbsp;&nbsp;
		          				<input type="hidden" name="questionNo" value="${question.questionNo}">
		          				<input type="hidden" name="examPaperId" value="${examPaperId}">
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
		          				<b class="pl15">选择答案：</b>
		          				<label><input type="radio" name="answer2"  value="A">A</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer2"  value="B">B</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer2"  value="C">C</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer2"  value="D">D</label>&nbsp;&nbsp;
		          				<input type="hidden" name="questionNo" value="${question.questionNo}">
		          				<input type="hidden" name="examPaperId" value="${examPaperId}">
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
		          				<b class="pl15">选择答案：</b>
		          				<label><input type="radio" name="answer1"  value="A">A</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="B">B</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="C">C</label>&nbsp;&nbsp;
		          				<label><input type="radio" name="answer1"  value="D">D</label>&nbsp;&nbsp;
		          				<input type="hidden" name="questionNo" value="${question.questionNo}">
		          				<input type="hidden" name="examPaperId" value="${examPaperId}">		          				
		          		</div>							
						</form>
						</c:if>
			</c:forEach>
					<input type="button" class="btn btn82 btn_save2" value="交卷" onclick="finishExam()">
           </div>


<script type="text/javascript">

    var examid='${examid}';
    var examPaperId='${examPaperId}';
    var category;
    var questionNo=1;
    var counter=${timeOut}*60;
    
    $("input[type!='button']").click(function(){  	
    	$.post("${pageContext.request.contextPath}/Student/SetAnswer",$(this).parent().parent().parent().serialize(),function(data){});
    });
    
    function finishExam(){
    	$.ajax({
    		type:"post",
    		url:"${pageContext.request.contextPath}/Student/FinishExam",
    		data:{id:${examPaperId}},
    		success:function(data){
    			if(data.split("|")[0]=="0"){
    				alert("交卷失败");    			
    			}else{
    				alert("考试结束,您本次考试的成绩是:"+data.split("|")[1]+"分。");
    				window.close();
    			}
    		}
    	});
    }
    

		init(counter);

		function init(counter){
			var h=Math.floor(counter/3600);
			var m=Math.floor((counter-h*3600)/60);
			var s=counter%60;
			displayCounter(h,m,s);
		}
		function count(){
			counter--;
			if(counter==0){
				finishExam();
				}
			init(counter);
		}
		function displayCounter(h,m,s){
			document.getElementById("timer").innerHTML=formatInt(h)+":"+formatInt(m)+":"+formatInt(s);
		}
		function formatInt(x){
			if(x<10)
				return "0"+x;
			else
				return x;
		}
	
		
		setInterval(count,1000);


	
</script>
  </body>
</html>
