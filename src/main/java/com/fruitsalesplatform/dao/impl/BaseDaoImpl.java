package com.fruitsalesplatform.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.fruitsalesplatform.dao.BaseDao;

public abstract class BaseDaoImpl<T> extends SqlSessionDaoSupport implements BaseDao<T>{
	@Autowired
	//mybatis-spring 1.0无需此方法，mybatis-spring 1.2必须要注入
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	private String ns;//命名空间
	public String getNs(){
		return ns;
	}
	public void setNs(String ns) {
		this.ns = ns;
	}
	public T get(Serializable id) {
		return this.getSqlSession().selectOne(ns + ".get", id);
	}

	public List<T> find(Map map) {
		List<T> oList=this.getSqlSession().selectList(ns+".find", map);
		System.out.println("oList------------"+oList);
		return oList;
	}
	public void insert(T entity) {
		this.getSqlSession().insert(ns+".insert", entity);
	}
	public void update(T entity) {
		// TODO Auto-generated method stub
		this.getSqlSession().update(ns+".update", entity);
	}
	public void deleteById(Serializable id) {
		// TODO Auto-generated method stub
		this.getSqlSession().delete(ns+".deleteById", id);
	}

	@Override
	public void delete(Serializable[] ids) {
		this.getSqlSession().delete(ns+".delete", ids);
		
	}
	
}
