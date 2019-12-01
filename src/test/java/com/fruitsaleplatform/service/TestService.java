package com.fruitsaleplatform.service;

import java.util.List;

import com.fruitsaleplatform.entity.User;

public interface TestService {
	public List<User> findUserByName(User user);
}
