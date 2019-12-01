package com.fruitsalesplatform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fruitsalesplatform.entity.User;
import com.fruitsalesplatform.service.UserService;

@Controller
public class UserController extends BaseController{
	@Resource
	UserService userService;
	@RequestMapping("/user/toLogin.action")
	public String tologin(){
		return "/login.jsp";//转向登陆界面
	}
	//列表
	@RequestMapping("user/login.action")
	public String login(User user,Model model,HttpServletRequest request){
		Map<String,String> map=new HashMap<String,String>();
		map.put("username", user.getUserName());
		map.put("password", user.getPassword());
		System.out.println("map----------"+map+user.getUserName());
		List<User> userList=userService.find(map);
		System.out.println("userList-----------------"+userList);
		if (userList!=null && userList.size()>0) {
			request.getSession().setAttribute("user", userList);
			//request.setAttribute("list", userList);
			return "/home.jsp";//转向主页
		}
		model.addAttribute("errorMsg", "登陆失败！账号或者密码错误！");//错误消息提示
		return "/login.jsp";//转向登陆页面
	}
	@RequestMapping("user/registerPage.action")
	public String toRegister(){
		return "/register.jsp";
	}
	@RequestMapping("user/register.action")
	public String register(User user,Model model,HttpServletRequest request,HttpServletResponse response)throws Exception{
		//查找账号是否已经注册
		Map<String, String> map=new HashMap<String,String>();
		map.put("username", user.getUserName());
		List<User> userList=userService.find(map);
		System.out.println("userList-----------"+userList);
		if (userList!=null&&userList.size()>0) {
			//如果查询到了，说明账号已经被注册，提示用户，并转发回注册页面
			model.addAttribute("errorMsg","注册失败，该用户名已经被注册");
			return "/register.jsp";
		}
		user.setUserId(UUID.randomUUID().toString());
		userService.insert(user);
		model.addAttribute("errorMsg", "注册成功，请输入账号和密码进行登录！");
		return "/login.jsp";
		
	}
}
