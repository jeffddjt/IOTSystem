package com.bohechina.iotsystem.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bohechina.iotsystem.model.LoginUser;

public class RoleCheck implements HandlerInterceptor {

	private String roleAllow;
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		HttpSession session= request.getSession();
		LoginUser loginUser=(LoginUser)session.getAttribute("loginUser");
		if(!loginUser.getRole().equals(roleAllow)){
			PrintWriter out = response.getWriter();
			out.print("<script>history.go(-1);</script>");
			return false;
		}else
		return true;
	}

	public String getRoleAllow() {
		return roleAllow;
	}

	public void setRoleAllow(String roleAllow) {
		this.roleAllow = roleAllow;
	}

}
