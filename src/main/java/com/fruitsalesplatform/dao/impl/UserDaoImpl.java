package com.fruitsalesplatform.dao.impl;

import org.springframework.stereotype.Repository;

import com.fruitsalesplatform.entity.User;
import com.fruitsalesplatform.dao.UserDao;
	@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	public UserDaoImpl() {
		//设置命名空间
		super.setNs("com.fruitsalesplatform.mapper.UserMapper");
	}
	//如果接口UserDao有新的方法定义，可以在下面继续实现

}
