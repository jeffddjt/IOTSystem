<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"> 
     <title>仪表工在线顶岗实训系统</title>
     <link rel="stylesheet" href="<%=path %>/assets/css/common.css"/>
    <link rel="stylesheet" href="<%=path %>/assets/css/style.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" media="screen" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.SuperSlide.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/navSlide.js">  </script>

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
            <h3>基础信息</h3>
            <ul>
                <li href="${pageContext.request.contextPath}/OperationPreview?">操作手册</li>
                <li href="${pageContext.request.contextPath}/Student/ProjectIntroduction?">项目介绍</li>
                <li href="${pageContext.request.contextPath}/Student/NoticeInfoView?">通知管理</li>
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?">待考提醒</li>
            </ul>
            <h3>企业文化</h3>
            <ul>
                <li href="${pageContext.request.contextPath}/Student/CorCulture?">企业文化内容</li>
                <li href="${pageContext.request.contextPath}/Student/EnterpriseVideoView">企业目视化展示</li>
                <li href="${pageContext.request.contextPath}/Student/Test?subject=03010000">理论训练</li>
                <li href="${pageContext.request.contextPath}/Student/TestOperation?subject=03010000&type=1">操作训练</li>
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?subject=03010000&category=1">理论测试</li>
                <li href="${pageContext.request.contextPath}/Student/TestOperation?subject=03010000&type=2">操作测试</li>
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?subject=03010000&category=2">理论测试补考</li>
            </ul>
            <div class="menu_h">素材知识库管理</div>
            <h3>设备库</h3>
            <ul>
                <li href="${pageContext.request.contextPath}/Student/ResourceInfoView?subject=01010000">演示</li>
                <li href="${pageContext.request.contextPath}/Student/Test?subject=01010000">训练</li>
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?subject=01010000&category=1">考试</li>
           	</ul>
            <h3>仪表库</h3>
            <ul>
                <li href="${pageContext.request.contextPath}/Student/ResourceInfoView?subject=01020000">演示</li>
                <li href="${pageContext.request.contextPath}/Student/Test?subject=01020000">训练</li>   
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?subject=01020000&category=1">考试</li>

             </ul>
             <h3>标准仪器库</h3>
             <ul>             
                <li href="${pageContext.request.contextPath}/Student/ResourceInfoView?subject=01030000">演示</li>
                <li href="${pageContext.request.contextPath}/Student/Test?subject=01030000">训练</li>
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?subject=01030000&category=1">考试</li>             
             </ul>
             <h3>工具库</h3>       
             <ul>         
                <li href="${pageContext.request.contextPath}/Student/ResourceInfoView?subject=01040000">演示</li>
                <li href="${pageContext.request.contextPath}/Student/Test?subject=01040000">训练</li>    
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?subject=01040000&category=1">考试</li>                  
              </ul>
              <h3>材料库</h3>
              <ul>         
                <li href="${pageContext.request.contextPath}/Student/ResourceInfoView?subject=01050000">演示</li>
                <li href="${pageContext.request.contextPath}/Student/Test?subject=01050000">训练</li>    
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?subject=01050000&category=1">考试</li>                  
               </ul>
               <h3>考试</h3>
              <ul>
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?subject=01&category=1">综合考核</li>
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?subject=01&category=2">综合考核补考</li>
            </ul>
             <div class="menu_h">仪表工顶岗实训管理</div>
            <h3>装置仿真演示</h3>
             <ul>
                <li href="${pageContext.request.contextPath}/Student/DemoView?subject=02010000&type=1">催化装置工艺流程</li>
                <li href="${pageContext.request.contextPath}/Student/DemoView?subject=02010000&type=2">三催化装置概况</li>
                <li href="${pageContext.request.contextPath}/Student/DemoView?subject=02010000&type=3">催化装置虚拟化工厂</li>
                <li href="${pageContext.request.contextPath}/Student/UnJoinedExam?subject=02010000&category=1">装置仿真演示考试</li>
            </ul>
            
            <h3>巡检训练</h3>
            <ul>
                <li href="Student/PollingRouteView">巡检路线图</li>
                <li href="${pageContext.request.contextPath}/Student/PollingRoleView?type=1">仪表科巡管理规定</li>
                <li href="${pageContext.request.contextPath}/Student/PollingRoleView?type=2">日常维护及巡检规程</li>
                <li href="${pageContext.request.contextPath}/Student/PollingView?type=1">日巡检</li>
                <li href="${pageContext.request.contextPath}/Student/PollingView?type=2">月巡检</li>
                <li href="${pageContext.request.contextPath}/Student/PollingVideoView?type=1">仪表巡检视频</li>
                <li href="${pageContext.request.contextPath}/Student/Test?subject=02020000">巡检规程训练</li>
            </ul>
            <h3>故障处理</h3>      
            <ul>
                <li href="${pageContext.request.contextPath}/Student/TroubleView">值班故障处理</li>
                <li  href="${pageContext.request.contextPath}/Student/PollingVideoView?type=2">装置检修演示视频</li>
                <li href="${pageContext.request.contextPath}/Student/TroubleRepairVrp">检修准备虚拟工厂</li>
            </ul>            
            <h3>安全演练</h3>
            <ul>
                <li href="${pageContext.request.contextPath}/Student/PollingVideoView?type=3">演示视频</li>
            </ul>

        </div>
    </div>
    <div class="main">
        <iframe name="right" id="rightMain" src="Student/Main" frameborder="no" scrolling="auto" width="100%" height="auto" allowtransparency="true"></iframe>
    </div>
    <div class="bottom">
        <div id="bottom_bg">版权</div>
    </div>
    <div class="scroll">
        <a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(1);"></a>
        <a href="javascript:;" class="next" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(2);"></a>
    </div>
    
    
    <script type="text/javascript">
        $(function () {
            $(".sideMenu li").mouseover(function () {
                $(".sideMenu li").removeClass("on");
                $(this).addClass("on");
            }).mouseout(function () {
                $(this).removeClass("on");
            }).click(function () {
                $(".sideMenu li").removeClass("sel");
                $(this).addClass("sel");
                $("#rightMain").attr("src", $(this).attr("href"));
                //$("#here_area").text($("#here_area").text() + " -> 正在加载页面……");
            });
        });

        function setLocation(location) {
            $("#here_area").text("当前位置："+location);
        }
    </script>
  </body>
</html>
