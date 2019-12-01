package com.fruitsalesplatform.dao;

import java.util.Map;

import com.fruitsalesplatform.entity.Commodities;

public interface CommoditiesDao extends BaseDao<Commodities>{
	public int count(Map map);//根据条件统计结果集数量
}
