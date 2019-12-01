package com.fruitsaleplatform.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fruitsaleplatform.entity.User;

public class DBConnectionTest {
	//首先测试数据库的连通性
	//Mybatis的配置文件
	private String resource="beans.xml";
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession sqlSession=null;
	public SqlSession getSqlSession() throws Exception{
		//获取一个String类加载配置对象
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext(resource);
		//从配置对象中创建会话工厂，并注入MyBatis配置文件信息
		sqlSessionFactory=(SqlSessionFactory)context.getBean("sessionFactory");
		sqlSession=sqlSessionFactory.openSession();
		return sqlSession;
	}
	@Test
	public void testServlet() throws Exception{
		sqlSession=getSqlSession();
		User user=sqlSession.selectOne("test.findUserByName", "张三");
		System.out.println("取出用户的信息：");
		System.out.println("账号："+user.getUserid());
		System.out.println("用户名："+user.getName());
		System.out.println("密码："+user.getPassword());
		System.out.println("电话："+user.getTelphone());
	}
	
	
	/*@Test
	public void testConnection()throws Exception
	{
		//获取SPring类加载配置对象
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext(resource);
		//从配置对象中创建会话工厂，并注入到mybatis配置文件的信息
		sqlSessionFactory=(SqlSessionFactory)context.getBean("sessionFactory");
		sqlSession=sqlSessionFactory.openSession();
		测试与空数据库链接是否可行
		 * if (sqlSession!=null) {
			System.out.println("MyBaties-数据库连接成功！目前的SQL配置数目：");
			System.out.println(sqlSession.getConfiguration().getMappedStatements().size());
		}else{
			System.out.println("mybatis-数据库连接失败!");
		}
	}*/
	
	
}
