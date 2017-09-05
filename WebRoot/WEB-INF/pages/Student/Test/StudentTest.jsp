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
     
     <link rel="stylesheet" href="<%=path %>/assets/css/common.css"/>
     <link rel="stylesheet" href="<%=path %>/assets/css/main.css"/>
        <link href="<%=path%>/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
     <script type="text/javascript" src="<%=path%>/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/assets/js/jquery.SuperSlide.js"></script>
     <script type="text/javascript" src="<%=path%>/assets/js/navSlide.js">  </script>

	<style>
	body{font-family: "微软雅黑";margin:0;background:#e7f1f7;}
	.Questionbox{padding:10px;}
	.itemRes{
		float:right;
		margin:10px;
	}
	li {list-style:none;float:left;width:160px;text-align:center;}
	.answerArea{margin-top:20px;}
	
	#counter{top:0;right:0;color:red;width:200px;height:30px;position: fixed;line-height:30px;text-align:center;}
	.Questionbox{margin-top:30px;}

	</style>

  </head>
  
  <body>
            <div id="counter">剩余时间：<span id="timer"></span></div>
           <div class="Questionbox">  
           <c:forEach items="${questionList}" var="question">
           
           <!-- 单选题开始 -->               
           		<c:if test="${question.questionCategory eq 'SingleQuestion' }">
           			<div id="SingleQuestionBox">
           				<div class="itemRes"><img id="SingleQuestionItemRes" src="${pageContext.request.contextPath}/${question.singleQuestion.itemRes}" width="240" height="240" onerror="this.style.display='none'"></div>
           				<span id="SingleQuestionNo">${question.questionNo}.</span>
           				<span id="SingleQuestionItemText">${question.singleQuestion.itemText}</span>
           				<div style="clear:both;"></div>
           					<ul>
           						<li><img id="SingleQuestionChoiceResA"  src="${pageContext.request.contextPath}/${question.singleQuestion.choiceResA}"  width="120" height="120" onerror="this.style.display='none'"><div id="SingleQuestionChoiceTextA" >A.${question.singleQuestion.choiceTextA}</div></li>
           						<li><img id="SingleQuestionChoiceResB"  src="${pageContext.request.contextPath}/${question.singleQuestion.choiceResB}"  width="120" height="120" onerror="this.style.display='none'"><div id="SingleQuestionChoiceTextB" >B.${question.singleQuestion.choiceTextB}</div></li>
           						<li><img id="SingleQuestionChoiceResC"  src="${pageContext.request.contextPath}/${question.singleQuestion.choiceResC}"  width="120" height="120" onerror="this.style.display='none'"><div id="SingleQuestionChoiceTextC" >C.${question.singleQuestion.choiceTextC}</div></li>
           						<li><img id="SingleQuestionChoiceResD"  src="${pageContext.request.contextPath}/${question.singleQuestion.choiceResD}"  width="120" height="120" onerror="this.style.display='none'"><div id="SingleQuestionChoiceTextD" >D.${question.singleQuestion.choiceTextD}</div></li>
           					</ul>
           				<div style="clear:both;"></div>
           				<div class="answerArea">
           						 <b>选择答案：</b>
           						 <form id="testForm${question.questionNo }">
           						 <input type="hidden" name="questionNo" value="${question.questionNo}">
           						 <input type="hidden" name="testid" value="${testid}">
           						 <label><input type="radio" name="stu_answer"  value="A">A</label>
           						 <label><input type="radio" name="stu_answer"  value="B">B</label>
           						 <label><input type="radio" name="stu_answer"  value="C">C</label>
           						 <label><input type="radio" name="stu_answer"  value="D">D</label>
           						 </form>

           				</div>
           			</div>
           			</c:if>
	<!-- 单选题结束 -->
	
	<!-- 多选题开始 -->
						<c:if test="${question.questionCategory eq 'MultipleQuestion'}">
	           			<div id="MultipleQuestionBox">
           				<div class="itemRes"><img id="MultipleQuestionItemRes"  src="${pageContext.request.contextPath}/${question.multipleQuestion.itemRes}"   width="240" height="240" onerror="this.style.display='none'"></div>
           				<span id="MultipleQuestionNo">${question.questionNo}.</span>
           				<span id="MultipleQuestionItemText">${question.multipleQuestion.itemText }</span>
           				<div style="clear:both;"></div>
           					<ul>
           						<li>
           								<img id="MultipleQuestionChoiceResA"  src="${pageContext.request.contextPath}/${question.multipleQuestion.choiceResA}"  width="120" height="120" onerror="this.style.display='none'">
           								<div id="MultipleQuestionChoiceTextA" >
           									A.${question.multipleQuestion.choiceTextA }
           								</div>
           						</li>
           						<li>
           							<img id="MultipleQuestionChoiceResB"  src="${pageContext.request.contextPath}/${question.multipleQuestion.choiceResB}"   width="120" height="120" onerror="this.style.display='none'">
           							<div id="MultipleQuestionChoiceTextB" >
           								B.${question.multipleQuestion.choiceTextB }
           							</div>
           						</li>
           						<li>
           							<img id="MultipleQuestionChoiceResC"  src="${pageContext.request.contextPath}/${question.multipleQuestion.choiceResC}"  width="120" height="120" onerror="this.style.display='none'">
           							<div id="MultipleQuestionChoiceTextC" >
           								C.${question.multipleQuestion.choiceTextC }
           							</div>
           						</li>
           						<li>
           							<img id="MultipleQuestionChoiceResD"  src="${pageContext.request.contextPath}/${question.multipleQuestion.choiceResD}"  width="120" height="120" onerror="this.style.display='none'">
           							<div id="MultipleQuestionChoiceTextD" >
           								D.${question.multipleQuestion.choiceTextD }
           							</div>
           						</li>
           						<li>
           							<img id="MultipleQuestionChoiceResE"  src="${pageContext.request.contextPath}/${question.multipleQuestion.choiceResE}"   width="120" height="120" onerror="this.style.display='none'">
           							<div id="MultipleQuestionChoiceTextE" >
           								E.${question.multipleQuestion.choiceTextE }
           							</div>
           						</li>
           						<li>
           							<img id="MultipleQuestionChoiceResF"  src="${pageContext.request.contextPath}/${question.multipleQuestion.choiceResF}"   width="120" height="120" onerror="this.style.display='none'">
           							<div id="MultipleQuestionChoiceTextF" >
           								F.${question.multipleQuestion.choiceTextF }
           							</div>
           						</li>
           					</ul>
           				<div style="clear:both;"></div>
           				<div class="answerArea">
           						 <b>选择答案：</b>         
           						 <form id="testForm${question.questionNo }">
           						 <input type="hidden" name="questionNo" value="${question.questionNo}">
           						 <input type="hidden" name="testid" value="${testid}">
           						 <label><input type="checkbox"  name="stu_answer" value="A" >A</label>
           						 <label><input type="checkbox"  name="stu_answer" value="B" >B</label>
           						 <label><input type="checkbox"  name="stu_answer" value="C" >C</label>
           						 <label><input type="checkbox"  name="stu_answer" value="D" >D</label>
           						 <label><input type="checkbox"  name="stu_answer" value="E" >E</label>
           						 <label><input type="checkbox"  name="stu_answer"  value="F" >F</label>
           						 </form>
           				</div>
           			</div>
			</c:if>
	<!-- 多选题结束 -->
	
	<!-- 判断题开始 -->
			<c:if test="${question.questionCategory eq 'WhetherQuestion'}">
		      <div id="WhetherQuestionBox">
           				<div class="itemRes">
           					<img id="WhetherQuestionItemRes" src="${pageContext.request.contextPath}/${question.whetherQuestion.itemRes}"  width="240" height="240" onerror="this.style.display='none'">
           				</div>
           				<span id="WhetherQuestionNo">${question.questionNo }.</span>
           				<span id="WhetherQuestionItemText">${question.whetherQuestion.itemText }</span>
           				<div style="clear:both;"></div>
           				<div class="answerArea">
           						 <b>选择答案：</b>
           						 <form id="testForm${question.questionNo }">
           						 <input type="hidden" name="questionNo" value="${question.questionNo}">
           						 <input type="hidden" name="testid" value="${testid}">           						 
           						 <label><input type="radio" name="stu_answer"  value="1">对</label>
           						 <label><input type="radio" name="stu_answer"  value="0">错</label>
           						 </form>
           				</div>
           			</div>	
           			</c:if>
	<!-- 判断题结束 -->
	<!-- VRP虚拟化工厂题开始 -->
			<c:if test="${question.questionCategory eq 'VRPQuestion' }">
			      <div id="VRPQuestionBox">
           				<span id="VRPQuestionNo">${question.questionNo }</span>.
           				<span id="VRPQuestionItemText">${question.vrpQuestion.itemText }</span>
           				<div style="clear:both;"></div>
           				<iframe id="VRPQuestionItemRes"  style="width:100%;height:600px;border:none;" src="${pageContext.request.contextPath}/${question.vrpQuestion.itemRes}"> </iframe>
           				<div class="answerArea">

           				</div>
           			</div>	
				</c:if>
	<!-- VRP虚拟化工厂题结束 -->
	</c:forEach>
					<input type="button" class="btn btn82 btn_save2" value="交卷" onclick="finishTest()">
           </div>


<script type="text/javascript">

    var testid='${testid}';
    var category;
    var questionNo=1;
    var counter=${timeOut}*60;
    
    $("input[type!='button']").click(function(){
    	$.post("${pageContext.request.contextPath}/Student/SetTestAnswer",$(this).parent().parent().serialize(),function(data){});
    });
    
    function finishTest(){
    	$.ajax({
    		type:"post",
    		url:"${pageContext.request.contextPath}/Student/FinishTest",
    		data:{id:${testid}},
    		success:function(data){
    			if(data.split("|")[0]=="0"){
    				alert("交卷失败");    			
    			}else{
    				alert("考试结束,您本次考试的成绩是:"+data.split("|")[1]+"分。");
    				window.location.href=document.referrer;
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
				finishTest();
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
