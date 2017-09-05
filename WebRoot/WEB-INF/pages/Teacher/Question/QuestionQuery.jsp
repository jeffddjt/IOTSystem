<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
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
	</style>
  </head>
  
  <body>
        <div class="container">
        <div id="search_bar" class="mt10">
            <div class="box">
                <div class="box_border">
                    <div class="box_top"><b class="pl15">题库信息</b></div>
                    <div class="box_center pt10 pb10" style="margin:10px 40px;">
                    <form method="post" action="<%=path %>/Teacher/QuestionQuery">
                    <table>
                    <tr>
                    <td>题目:</td>
                    <td><input type="text" name="itemText" style="height:20px;width:200px;border:1px solid #eee;"></td>
                    <td>试题类别:</td>
                    <td>
                    		<select name="category" style="border:1px solid #eee;">
                    			<option value="">全部</option>
                    			<option value="SingleQuestion">单选题</option>
                    			<option value="MultipleQuestion">多选题</option>
                    			<option value="WhetherQuestion">判断题</option>
                    			<option value="VRPQuestion">VRP虚拟工厂题</option>
                    		</select>
                   </td>
                   <td>分值:</td>
                   <td>
                   		<select name="operatorScore" style="border:1px solid #eee;">
                   			<option value="">全部</option>
                   			<option value="=">等于</option>                   			
                   			<option value="&gt;">大于</option>
                   			<option value="&lt;">小于</option>
                   		</select>
                   </td>
                   <td><input type="text" name="score" style="width:30px;height:20px;border:1px solid #eee;" value="0">分</td>
                   <td>经验值:</td>
                   <td>
                    		<select name="operatorExperience" style="border:1px solid #eee;">
                   			<option value="">全部</option>
                   			<option value="=">等于</option>                   			
                   			<option value="&gt;">大于</option>
                   			<option value="&lt;">小于</option>
                   		</select>                  
                   </td>
                   <td><input type="text" name="experience" style="width:30px;height:20px;border:1px solid #eee;" value="0">点</td>
                    <td>
                    	<input type="hidden" name="subject" value="${subject}">
			            <input type="submit" name="button" class="btn btn82 btn_search" value="查询" onclick="window.location.href='<%=path %>/Teacher/QuestionQuery?subject=${subject}'"/>
					</td>
					</tr>
					</table>
					</form>
                    </div>
                </div>
            </div>
            </div>
        <div id="table" class="mt10">
            <div class="box span10 oh">
                <div id="contentDiv" >
                <form id="questionForm">
                    <input type="hidden" id="subject" name="subject" value="${subject}">
                    <input type="hidden" id="category" name="category" value="${category}">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>
                            <th > 题目 </th >
                            <th width="100">分值</th>
                            <th width="100">经验值</th>
                            <th width="150">试题类别</th>
                            <th width = "150" > 创建时间 </th>
                            <th width = "150" > 最后更新时间 </th> 
                        </tr>
                        <c:forEach items="${Question}" var="question">
                        <tr class="tr" >
                            <td class="td_center">
                                <input type = "checkbox" name="Selected" value="${question.id}">
                            </td >
                            <td><a class="questionItem" href="Teacher/${question.category}Update?id=${question.id}">${question.itemText}</a></td>
                            <td style="text-align:right;">${question.score}</td>
                            <td style="text-align:right;">${question.experience}</td>
                            <td>${question.categoryName}</td>
                            <td><fmt:formatDate value="${question.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${question.lastUpdateTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                        </tr>
                        </c:forEach>
                    </table>
                    </form>
                </div>
                <div class="page mt10">
                    <div class="pagination">
							
                    </div>

                </div>
            </div>
        </div>



        
    </div>

    <script type="text/javascript">
        $(function () {
            initialize();
            $(".questionCategory").click(function () {
                window.location.href = "${pageContext.request.contextPath}/Teacher/QuestionManage?subject=${subject}&category=" + $(this).attr("category");
            });

            function initialize() {
                var category = window.location.href.split('?')[1].split('&')[1];
                if (category == null || category == undefined)
                    return;
                category = category.split('&')[0].split('=')[1];
                $(".questionCategory").removeClass("ext_btn_submit");
                $(".questionCategory[category=" + category + "]").addClass("ext_btn_submit");
            }            
        });
        
       function SelectAll(){
        	$(":checkbox").each(function(){
        		$(this).prop({checked:true});
        	});
        }
        
        function UnSelectAll(){
        	$(":checkbox").each(function(){
        		$(this).prop({checked:false});
        	});
        }

		function deleteQuestion(){
			if(!confirm("真的要删除这些题目吗？"))
				return;
			$.post("${pageContext.request.contextPath}/Teacher/QuestionDelete",$("#questionForm").serialize(),
			function(data){						
						if (data.split("|")[0] != "0")
							self.location.reload();
						else
							alert(data.split("|")[1]);
			});	
		
		}

        parent.window.setLocation("${subject} - 试题查询");
    </script>
  </body>
</html>
