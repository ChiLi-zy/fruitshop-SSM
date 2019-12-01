package com.fruitsalesplatform.dao;

import com.fruitsalesplatform.entity.User;

public interface UserDao extends BaseDao<User> {
	//在这里就可以直接继承BaseDao里的相关方法
	//以后还可以添加新的方法定义
}
