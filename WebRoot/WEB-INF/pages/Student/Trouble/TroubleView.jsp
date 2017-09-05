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
        
        <div id="table" class="mt10">
            <div class="box span10 oh">
                <div id="contentDiv" >
                <form id="resourceInfoForm">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>
                            <th > 故障名称 </th >
                            <th colspan="2">学习</th>
                            <th colspan="2">训练</th>
                            <th colspan="2">测试</th>

                        </tr>
                        <c:forEach items="${troubleList}" var="trouble">
                        <tr class="tr" >
                            <td class="td_center">
                                ${trouble.no}
                            </td >
                            <td>${trouble.name}</td>
                            <td class="td_center"><a class="questionItem" href="${pageContext.request.contextPath}/Student/TroubleStudy?id=${trouble.id}&type=1">操作间</a></td>
                            <td class="td_center"><a class="questionItem" href="${pageContext.request.contextPath}/Student/TroubleStudy?id=${trouble.id}&type=2">现场</a></td>
                            <td class="td_center"><a class="questionItem" href="${pageContext.request.contextPath}/Student/TroubleVrp?id=${trouble.id}&type=1">操作间</a></td>
                            <td class="td_center"><a class="questionItem" href="${pageContext.request.contextPath}/Student/TroubleVrp?id=${trouble.id}&type=2">现场</a></td>
                            <td class="td_center"><a class="questionItem" href="${pageContext.request.contextPath}/Student/TroubleVrp?id=${trouble.id}&type=3">操作间</a></td>
                            <td class="td_center"><a class="questionItem" href="${pageContext.request.contextPath}/Student/TroubleVrp?id=${trouble.id}&type=4">现场</a></td>

                        </tr>
                        </c:forEach>
                    </table>
                    </form>
                </div>
                <div class="page mt10">
                    <div class="pagination">
						<bh:BHPager pageNo="${pageNo}" url="Student/TroubleView?"  pageCount="${pageCount}"/>
                    </div>

                </div>
            </div>
        </div>



        
    </div>

    <script type="text/javascript">

        
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

		function deleteResourceInfo(){
			if(!confirm("真的要删除这些故障信息吗？"))
				return;
			$.post("${pageContext.request.contextPath}/Teacher/TroubleDelete",$("#resourceInfoForm").serialize(),
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

        parent.window.setLocation("值班故障处理 - 设置");
    </script>
  </body>
</html>