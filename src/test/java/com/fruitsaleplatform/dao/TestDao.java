package com.fruitsaleplatform.dao;

import java.util.List;

import com.fruitsaleplatform.entity.User;

public interface TestDao {
	public List<User> findUserByName(User user);
}
