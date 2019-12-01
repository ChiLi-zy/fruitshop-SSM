package com.fruitsalesplatform.util;

import redis.clients.jedis.Jedis;

public class RedisUtil {
	public static void main(String[] atgs){
		Jedis jedis=new Jedis("localhost",6379);//链接Redis
		int i = 0; //记录一下操作次数
		try{
			long start=System.currentTimeMillis();//开始的毫秒数
			while(true){
				long end=System.currentTimeMillis();
				if(end-start>=1000){
					//当大于等于1000毫秒时，结束操作
					break;
				}
				i++;
				jedis.set("test"+i,i+"");
			}
		}finally{
		//关闭链接
		jedis.close();
	}
	System.out.println("redis每秒操作："+i+"次");
	}
}
