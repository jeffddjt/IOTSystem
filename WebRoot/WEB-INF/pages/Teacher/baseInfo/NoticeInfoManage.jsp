<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="bh" uri="http://www.bohechina.com/tag-html" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>仪表工在线顶岗实训系统</title>
<link rel="stylesheet" href="<%=path%>/assets/css/common.css" />
<script type="text/javascript" src="<%=path%>/assets/js/jquery.min.js"></script>
<link rel="stylesheet" href="<%=path%>/assets/css/main.css" />
<script type="text/javascript"
	src="<%=path%>/assets/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="<%=path%>/assets/js/navSlide.js"></script>
<style>
    a{color:#000;}
    a:hover{color:#f00;}
</style>
</head>

<body>
	<div class="container">
		<div id="button" class="mt10">
			<input type="button" name="button" class="btn btn82 btn_add" value="新增" onclick="window.location.href = '${pageContext.request.contextPath}/Teacher/NoticeInfoAdd'" />
			<input type="button" name="button" class="btn btn82 btn_del"	value="删除" onclick="deleteNotice()" /> 
			<input type="button" name="button" class="btn btn82 btn_checked" 	value="全选" onclick="selectAll()" /> 
			<input type="button" name="button" class="btn btn82 btn_nochecked" value="取消"  onclick="unSelectAll()"/>

		</div>
		<div id="table" class="mt10">
			<div class="box span10 oh">
				<div id="contentDiv">
					<form id="form1">
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="list_table">
							<tr>
								<th width="30">#</th>
								<th>通知标题</th>
								<th width="200">创建时间</th>
								<th width="200">最后更新时间</th>
							</tr>

							<c:forEach items="${NoticeInfoList }" var="notice">
								<tr class="tr">
									<td class="td_center"><input type="checkbox"
										name="selected" value="${notice.id}"></td>
									<td><a href="Teacher/NoticeInfoUpdate?id=${notice.id}">${notice.title }</a></td>
									<td><fmt:formatDate value="${notice.createTime }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><fmt:formatDate value="${notice.lastUpdateTime }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
								</tr>
							</c:forEach>
						</table>
					</form>
				</div>
				<div class="page mt10">
					<div class="pagination">
						<bh:BHPager pageNo="${pageNo}" url="Teacher/NoticeInfoManage?" pageCount="${pageCount}" />
					</div>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			initialize();

			$(".questionCategory").click(
					function() {
						window.location.href = "QuestionManage.aspx?category="
								+ $(this).attr("category");
					});

			function initialize() {
				var category = window.location.href.split('?')[1];
				if (category == null || category == undefined)
					return;
				category = category.split('&')[0].split('=')[1];
				$(".questionCategory").removeClass("ext_btn_submit");
				$(".questionCategory[category=" + category + "]").addClass(
						"ext_btn_submit");
			}
		});

		function deleteNotice() {
			if (!confirm("真的要删除吗?"))
				return;

			$.post("Teacher/NoticeInfoDelete", $("#form1").serialize(),
					function(data) {
						alert(data.split("|")[1]);
						if(data.split("|")[0]!="0")
							location.reload();
					});

		}

		function selectAll(){
			$(":checkbox").each(function(){
				$(this).prop({ checked: true });
			});
		}
		
		function unSelectAll(){
			$(":checkbox").each(function(){
				$(this).prop({checked:false});
			});
		}
		
		parent.window.setLocation("基础信息 -- 通知管理");
	</script>
</body>
</html>
