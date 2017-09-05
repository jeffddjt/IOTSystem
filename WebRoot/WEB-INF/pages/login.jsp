<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆界面 -- 仪表工在线顶岗实训系统</title>
    <meta charset="utf-8"> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <link rel="stylesheet" href="<%=path %>/assets/css/login.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" media="screen" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
        <div id="login_top">
		<div id="welcome">
			欢迎使用仪表工在线顶岗实训系统 （辽宁石化职业技术学院 生产过程自动化专业）
		</div>
		<!--<div id="back">
			<a href="#">返回首页</a>&nbsp;&nbsp; | &nbsp;&nbsp;
			<a href="#">帮助</a>
		</div>-->
	</div>
	<img id="bgimg" src="<%=path%>/assets/images/bg.jpg" width="100%" height="100%">
	<div id="login_center">
		<div id="login_area">
			<div id="login_form">
				<form id="form" method="post" >
					<div id="login_tip">
						用户登录&nbsp;&nbsp;UserLogin
					</div>
					<div><input type="text" class="username" id="Account" name="account" /></div>
					<div><input type="password" class="pwd" id="Password" name="password" /></div>
					<div style="line-height:30px; margin-top:10px;cursor: pointer;">
						<label><input type="radio" style="width:18px;height:18px;" name="role"  value="Student" checked="checked">&nbsp;学生</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="radio" style="width:18px;height:18px;" name="role"  value="Teacher"  >&nbsp;教师</label>
					</div>
					<div id="btn_area">
                        
						<input id="VerifyCode" name="verifycode" type="text" class="verify"/>&nbsp;&nbsp;
						<img id="VerifyCodeImg" src="VerifyCode" alt="" width="80" height="40" style="cursor: pointer;" onClick="this.src='VerifyCode?'+Math.random()"/><br/>
						<input id="sub_btn"  type="button" value="登&nbsp;&nbsp;录"  />
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="login_bottom">
		版权所有Copyright© 2015 博赫科技开发有限公司
	</div>
    <script src="assets/js/jquery.min.js"></script>
    <script type="text/javascript">
		
		document.onkeydown=function(e){
			var theEvent=window.event||e;
			var code=theEvent.keyCode||theEvent.whitch;
			if(code==13){
				$("#sub_btn").click();
			}
		};

        $(function () {
            $("#sub_btn").click(function () {
                var Account = $("#Account").val();
                var Password = $("#Password").val();
                var VerifyCode = $("#VerifyCode").val();
                if (Account == undefined || Account == "" || Password == undefined || Password == "" )
                {
                    alert("请输入账号或密码！");
                    return ;
                }
                if (VerifyCode == undefined || VerifyCode == "")
                {
                    alert("请输入验证码！");
                    return;
                }

                $.post("LoginVerify", $("#form").serialize(), function (data) {
                    if (data.split('|')[0] == "1")
                        window.location.href = '<%=path%>/'+data.split('|')[1];
                    else
                        alert(data.split('|')[1]);
                });
            });
        });
    </script>
  </body>
</html>
