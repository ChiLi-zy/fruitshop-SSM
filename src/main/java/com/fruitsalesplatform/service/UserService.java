package com.fruitsalesplatform.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.fruitsalesplatform.entity.User;

public interface UserService  {
	public User get(Serializable id);//只查询一个数据，常用于修改
	public List<User> find(Map map);//根据条件查询多个结果
	public void insert(User user);
	public void update(User user);
	public void deleteById(Serializable id);//按id进行删除，删除一条，支持整型和字符串类型
	public void delete(Serializable[] ids);//批量删除
}
