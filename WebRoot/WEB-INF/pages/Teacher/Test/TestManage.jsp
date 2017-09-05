<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="bh" uri="http://www.bohechina.com/tag-html" %>
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
        <link href="<%=path%>/assets/js/uploadfy/uploadify.css" rel="stylesheet" />
     <script type="text/javascript" src="<%=path%>/assets/js/jquery.min.js"></script>
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
        
        <div id="button" class="mt10">
            <input type="button" name="button" class="btn btn82 btn_add" value="新增"  onclick="window.location.href = '<%=path%>/Teacher/TestAdd?subject=${subject}&category=${category}'" />
            <input type="button" name="button" class="btn btn82 btn_del" value="删除"  onclick="deleteTest()"/>
            <input type="button" name="button" class="btn btn82 btn_checked" value="全选" onclick="SelectAll()"/>
            <input type="button" name="button" class="btn btn82 btn_nochecked" value="取消" onclick="UnSelectAll()"/>
        </div>        
        
        <div id="table" class="mt10">
            <div class="box span10 oh">
                <div id="contentDiv" >
                <form id="testForm">
                    <input type="hidden" id="subject" name="subject" value="${subject}">
                    <input type="hidden" id="category" name="category" value="${category}">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>
                            <th > 测试名称 </th >
                            <th width="100">题目数量</th>
                            <th width="100">考试时长</th>
                            <th width="150">经验值</th>
                            <th width = "150" > 创建时间 </th>
                            <th width = "150" > 最后更新时间 </th> 
                        </tr>
                        <c:forEach items="${TestList}" var="test">
                        <tr class="tr" >
                            <td class="td_center">
                                <input type = "checkbox" name="selected" value="${test.id}">
                            </td >
                            <td><a class="questionItem" href="Teacher/TestUpdate?id=${test.id}">${test.testName}</a></td>
                            <td style="text-align:right;">${test.singleQuestionCount+test.multipleQuestionCount+test.whetherQuestionCount+test.vrpQuestionCount}</td>
                            <td style="text-align:right;">${test.duration}</td>
                            <td style="text-align:right;">${test.experience}</td>
                            <td><fmt:formatDate value="${test.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${test.lastUpdateTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                        </tr>
                        </c:forEach>
                    </table>
                    </form>
                </div>
                <div class="page mt10">
                    <div class="pagination">
							<bh:BHPager pageNo="${pageNo}" url="Teacher/Test/TestManage?subject=${subject}&category=${category}"  pageCount="${pageCount}"/>
                    </div>

                </div>
            </div>
        </div>



        
    </div>

    <script type="text/javascript">
        $(function () {
            initialize();
            $(".questionCategory").click(function () {
                window.location.href = "<%=path%>/Teacher/QuestionManage?subject=${subject}&category=" + $(this).attr("category");
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

		function deleteTest(){
			if(!confirm("真的要删除这些考试吗？"))
				return;
			$.post("Teacher/TestDelete",$("#testForm").serialize(),
			function(data){						
						if (data.split("|")[0] != "0")
						{
							alert(data.split("|")[1]);
							self.location.reload();
							}
						else
							alert(data.split("|")[1]);
			});	
		
		}

        parent.window.setLocation("${subject} - ${category}测试设置");
    </script>
  </body>
</html>