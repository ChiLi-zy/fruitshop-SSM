package com.fruitsaleplatform.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fruitsaleplatform.entity.User;
import com.fruitsaleplatform.service.TestService;
@Controller
public class TestControllerServlet {
	@Autowired
	private TestService testService;
	@RequestMapping("/user/findUser.action")
	private String findUser (User user,Model model)
	{
		List<User> userList=testService.findUserByName(user);
		System.out.println("userList----------"+userList);
		model.addAttribute(userList);
		return "/pages/test/test.jsp";
	}
	
}
