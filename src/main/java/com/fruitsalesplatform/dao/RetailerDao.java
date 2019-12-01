package com.fruitsalesplatform.dao;

import java.util.Map;

import com.fruitsalesplatform.entity.Retailer;

public interface RetailerDao extends BaseDao<Retailer>{
	//这里可以直接使用继承的BaseDao方法
	public int count (Map map);//根据条件统计结果集数量
}
