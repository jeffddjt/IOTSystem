<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>仪表工在线顶岗实训系统</title>
<link rel="stylesheet" href="<%=path%>/assets/css/common.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/style.css" />
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.ico"
	media="screen" />
<script type="text/javascript" src="<%=path%>/assets/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/assets/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="<%=path%>/assets/js/navSlide.js">
	
</script>

</head>

<body>
	<div class="top">
		<c:import url="../header.jsp"></c:import>

		<div id="side_here">
			<div id="side_here_l" class="fl"></div>
			<div id="here_area" class="fl">当前位置：首页</div>
		</div>
	</div>
	<div class="side">
		<div class="sideMenu" style="margin:0 auto">
			<h3>基础信息管理</h3>
			<ul>
				<li href="Teacher/OperationDocSetting">操作手册设置</li>
				<li href="Teacher/ProjectIntroduceSetting">项目介绍设置</li>
				<li href="Teacher/NoticeInfoManage">通知管理</li>
			</ul>
			<h3>企业文化管理</h3>
			<ul>
				<li href="Teacher/CorCultureManage/ContentManage">内容管理</li>
				<li href="Teacher/EnterpriseVideoManage">企业目视化管理</li>
				<li href="Teacher/QuestionManage?subject=03010000">题库管理</li>
				<li href="Teacher/ExamManage?subject=03010000&category=1">理论考核设置</li>
				<li href="Teacher/OperationManage?subject=03010000">操作训练及考核设置</li>
				<li href="Teacher/ExamManage?subject=03010000&category=2">理论补考设置</li>

			</ul>
			<div class="menu_h">素材知识库管理</div>
			<h3>设备库</h3>
			<ul>
				<li href="Teacher/ResourceInfoManage?subject=01010000">资源管理</li>
				<li href="Teacher/QuestionManage?subject=01010000">题库管理</li>
				<li href="Teacher/ExamManage?subject=01010000&category=1">考试管理
			</ul>
			</ul>
			<h3>仪表库</h3>
			<ul>
				<li href="Teacher/ResourceInfoManage?subject=01020000">资源管理</li>
				<li href="Teacher/QuestionManage?subject=01020000">题库管理</li>
				<li href="Teacher/ExamManage?subject=01020000&category=1">考试管理
			</ul>

			</ul>
			<h3>标准仪器库</h3>
			<ul>
				<li href="Teacher/ResourceInfoManage?subject=01030000">资源管理</li>
				<li href="Teacher/QuestionManage?subject=01030000">题库管理</li>
				<li href="Teacher/ExamManage?subject=01030000&category=1">考试管理
			</ul>
			</ul>
			<h3>工具库</h3>
			<ul>
				<li href="Teacher/ResourceInfoManage?subject=01040000">资源管理</li>
				<li href="Teacher/QuestionManage?subject=01040000">题库管理</li>
				<li href="Teacher/ExamManage?subject=01040000&category=1">考试管理
			</ul>
			</ul>
			<h3>材料库</h3>
			<ul>
				<li href="Teacher/ResourceInfoManage?subject=01050000">资源管理</li>
				<li href="Teacher/QuestionManage?subject=01050000">题库管理</li>
				<li href="Teacher/ExamManage?subject=01050000&category=1">考试管理
			</ul>
			</ul>
			<h3>考试</h3>
			<ul>
				<li href="Teacher/ExamManage?subject=01&category=1">综合考核设置</li>
				<li href="Teacher/ExamManage?subject=01&category=2">综合考核补考设置</li>
			</ul>
			<div class="menu_h">仪表工顶岗实训管理</div>
			<h3>装置仿真演示</h3>
			<ul>
				<li href="Teacher/DemoManage?subject=02010000">装置仿真演示管理</li>
			</ul>


			<h3>巡检训练管理</h3>
			<ul>
				<li href="Teacher/PollingRouteManage">路线图管理</li>
				<li href="Teacher/PollingRoleManage">巡检规程管理</li>
				<li href="Teacher/PollingManage?type=1">日巡检管理</li>
				<li href="Teacher/PollingManage?type=2">月巡检管理</li>
				<li href="Teacher/PollingVideoManage?type=1">仪表巡检视频管理</li>
				<li href="Teacher/QuestionManage?subject=02020000">题库管理</li>
			</ul>

			<h3>故障处理</h3>
			<ul>
				<li href="Teacher/TroubleManage">值班故障处理管理</a></li>
				<li href="Teacher/PollingVideoManage?type=2">装置检修演示视频管理</li>
				<li href="Teacher/QuestionManage?subject=02030000">题库管理</li>
			</ul>
			<h3>安全演练管理</h3>
			<ul>
				<li href="Teacher/PollingVideoManage?type=3">演示视频</li>
			</ul>
			<h3>学生管理</h3>
			<ul>
				<li href="Teacher/StudentInfo">信息管理</li>
			</ul>
			<h3>系统管理</h3>
			<ul>
				<li href="Teacher/TeacherInfoManage" target="right">教师管理</li>
			</ul>

		</div>
	</div>
	<div class="main">
		<iframe name="right" id="rightMain" src="Teacher/Main"
			frameborder="no" scrolling="auto" width="100%" height="auto"
			allowtransparency="true"></iframe>
	</div>
	<div class="bottom">
		<div id="bottom_bg">版权</div>
	</div>
	<div class="scroll">
		<a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏"
			onclick="menuScroll(1);"></a> <a href="javascript:;" class="next"
			title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(2);"></a>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".sideMenu li").mouseover(function() {
				$(".sideMenu li").removeClass("on");
				$(this).addClass("on");
			}).mouseout(function() {
				$(this).removeClass("on");
			}).click(function() {
				$(".sideMenu li").removeClass("sel");
				$(this).addClass("sel");
				$("#rightMain").attr("src", $(this).attr("href"));
				$("#here_area").text($("#here_area").text() + " -> 正在加载页面……");
			});
		});

		function setLocation(location) {
			$("#here_area").text("当前位置：" + location);
		}
	</script>
</body>
</html>
