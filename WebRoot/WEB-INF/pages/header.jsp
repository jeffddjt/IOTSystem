<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>


  </head>
  
  <body>
            <div id="top_t">
            <div id="logo" class="fl"></div>
            <div id="photo_info" class="fr">
                <div id="photo" class="fl">
                    <img src="<%=path%>/assets/images/a.png" alt="" width="60" height="60">
                </div>
                <div id="base_info" class="fr">
                    <div class="help_info">
                        <!-- <a href="1" id="hp">&nbsp;</a>
                        <a href="2" id="gy">&nbsp;</a> -->
                        <a href="Logout" id="out">退出</a>
                    </div>
                    <div class="info_center">
                    <c:if test="${sessionScope.loginUser.role eq 'Student'}">
                    	${sessionScope.user.stu_name }                    
                    </c:if>
                    <c:if test="${sessionScope.loginUser.role eq 'Teacher' }">
                    	${sessionScope.user.userName}
                    </c:if>
                    	<!-- 
                        <span id="nt">通知</span><span><a href="#"  id="notice">&nbsp;</a></span>
                        -->
                    </div>
                    <!-- <div id="dian"> </div> -->
                </div>
            </div>
        </div>
  </body>
</html>
