package com.fruitsalesplatform.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelandview) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		String uri=request.getRequestURI();
		System.out.println("uri___________"+uri);
		System.out.println("session-userName___________"+request.getSession().getAttribute("user"));
		//判断当前请求地址是否是登录和注册地址
		if(!(uri.contains("Login")||uri.contains("login")||uri.contains("register"))){
			//非登录请求
			if(request.getSession().getAttribute("user")!=null){
				return true;//说明已经登陆 放行
			}else{
				if (uri.contains("css")||uri.contains("js")||uri.contains("images")) {
					return true;//如果是静态资源 放行
				}
				else{
					//没有登录 跳转到登录界面
					response.sendRedirect(request.getContextPath()+"/user/toLogin.action");
				}
			}
		}else
		{
			//登录请求，直接放行
			return true;
		}
		return false;
	}
	
}
