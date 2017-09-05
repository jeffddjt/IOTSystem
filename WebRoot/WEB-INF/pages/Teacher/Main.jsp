<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>仪表工在线顶岗实训系统</title>
<link rel="stylesheet" href="<%=path%>/assets/css/common.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/main.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/style.css" />
<script type="text/javascript" src="<%=path%>/assets/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/assets/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="<%=path%>/assets/js/navSlide.js">
	
</script>
<style type="text/css">
.welcome {
	left:0;
	right:0;
	top:0;
	bottom:0;
	position: absolute;
}

</style>
</head>
<body>
	<div class="container">
		<div class="welcome">
			<img src="${pageContext.request.contextPath}/assets/images/sy_02.png" width="100%" height="100%">
		</div>
	</div>
</body>
</html>
