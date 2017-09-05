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
    
     <title>仪表工在线顶岗实训系统</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css"/>
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
	</style>

  </head>
  
  <body>
   <div class="container">
           <div id="table" class="mt10">
            <div class="box span10 oh">
                <div id="contentDiv" >
                <form id="examForm">
                    <input type="hidden" id="subject" name="subject" value="${subject}">
                    <input type="hidden" id="category" name="category" value="${category}">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>                            
                            <th > 考核名称 </th >        
                           <th width="100">科目</th>
                            <th width="100">类别</th>
                            <th width="100">题目数量</th>
                            <th width="100">考试时长</th>
                            <th width="150">经验值</th>
                            <th width = "150" > 创建时间 </th>
                            <th width = "150" > 最后更新时间 </th> 
                        </tr>
                        <c:forEach items="${examInfoList}" var="exam">
                        <tr class="tr" >
                            <td class="td_center">
                                <a class="questionItem" href="javascript:startExam(${exam.id})">开始考试</a>
                            </td >
                            <td>${exam.examName}</td>
                            <td>${exam.subject}</td>
                            <td>${exam.category}</td>
                            <td style="text-align:right;">${exam.qty}</td>
                            <td style="text-align:right;">${exam.duration}</td>
                            <td style="text-align:right;">${exam.experience}</td>
                            <td><fmt:formatDate value="${exam.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${exam.lastUpdateTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                        </tr>
                        </c:forEach>
                    </table>
                    </form>
                </div>
                <div class="page mt10">
                    <div class="pagination">
							<bh:BHPager pageNo="${pageNo}" url="Student/UnJoinedExam?subject=${subject}&category=${category}" pageCount="${pageCount}"/>
                    </div>

                </div>
            </div>
        </div>
   </div>
   <div id="msgboxcon">
   <div id="msgbox">正在生成试卷，请稍候...</div>
   </div>
   <script type="text/javascript">
   		function startExam(id){
   			if(!confirm("考试一旦开始，不可取消，确定开始考试吗？")){
   				return;
   			}
   			$("#msgboxcon").css({display:"block"});
   			$.ajax({
   				url:'${pageContext.request.contextPath}/Student/StartExam',
   				data:{"id":id},
   				success:function(data){   				    
   					if(data.split("|")[0]=="0"){
   						alert(data.split("|")[1]);
   						$("#msgboxcon").css({display:"none"});
   					}else{
   						$("#msgboxcon").css({display:"none"});
   						location.href=location.href;
   						window.showModalDialog("${pageContext.request.contextPath}/"+data.split("|")[1],
   								window,"dialogHeight:768px;dialogWidth:1024px;status:no");

   						//location.href="${pageContext.request.contextPath}/"+data.split("|")[1];

   					}
   						
   				}
   			});
   			
   		}
   		parent.window.setLocation("${subjectInfo.subject}--考试")
   </script>
  </body>
</html>
