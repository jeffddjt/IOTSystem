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
        
        <div id="button" class="mt10">
            <input type="button" name="button" class="btn btn82 btn_add" value="新增"  onclick="window.location.href = '${pageContext.request.contextPath}/Teacher/PollingVideoAdd?type=${type}'" />
            <input type="button" name="button" class="btn btn82 btn_del" value="删除"  onclick="deleteResourceInfo()"/>
            <input type="button" name="button" class="btn btn82 btn_checked" value="全选" onclick="SelectAll()"/>
            <input type="button" name="button" class="btn btn82 btn_nochecked" value="取消" onclick="UnSelectAll()"/>
        </div>        
        
        <div id="table" class="mt10">
            <div class="box span10 oh">
                <div id="contentDiv" >
                <form id="resourceInfoForm">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table"> 
                        <tr>
                            <th width = "30" >#</th>
                            <th > 视频名称 </th >

                        </tr>
                        <c:forEach items="${pollingVideoList}" var="pollingVideo">
                        <tr class="tr" >
                            <td class="td_center">
                                <input type = "checkbox" name="selected" value="${pollingVideo.id}">
                            </td >
                            <td><a class="questionItem" href="Teacher/PollingVideoUpdate?id=${pollingVideo.id}">${pollingVideo.name}</a></td>

                        </tr>
                        </c:forEach>
                    </table>
                    </form>
                </div>
                <div class="page mt10">
                    <div class="pagination">
						<bh:BHPager pageNo="${pageNo}" url="Teacher/PollingVideoManage?type=${type}"  pageCount="${pageCount}"/>
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
			if(!confirm("真的要删除这些资源吗？"))
				return;
			$.post("${pageContext.request.contextPath}/Teacher/PollingVideoDelete",$("#resourceInfoForm").serialize(),
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

        parent.window.setLocation("${title} - 设置");
    </script>
  </body>
</html>