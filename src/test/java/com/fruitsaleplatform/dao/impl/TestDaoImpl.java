package com.fruitsaleplatform.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fruitsaleplatform.dao.TestDao;
import com.fruitsaleplatform.entity.User;

@Repository //为了能够扫描到这个Dao 暴露注解为Repository
public class TestDaoImpl implements TestDao{
	@Autowired //注入sqlSessionFactory
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession sqlSession=null;
	private SqlSession getSqlSession(){
		if (sqlSession==null) {
			sqlSession=sqlSessionFactory.openSession();
		}
		return sqlSession;
	}
	public List<User> findUserByName(User user) {
		List<User> ulist=new ArrayList<>();
		ulist=getSqlSession().selectList("test.findUserByName","%"+user.getName()+"%");
		return ulist;
	}
}
