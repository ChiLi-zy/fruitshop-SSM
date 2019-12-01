package com.fruitsaleplatform.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruitsaleplatform.dao.TestDao;
import com.fruitsaleplatform.entity.User;
import com.fruitsaleplatform.service.TestService;
@Service //暴露注解为Service
public class TestServiceImpl implements TestService{
	@Autowired
	private TestDao testDao;
	public List<User> findUserByName(User user) {
		return testDao.findUserByName(user);
	}
}
