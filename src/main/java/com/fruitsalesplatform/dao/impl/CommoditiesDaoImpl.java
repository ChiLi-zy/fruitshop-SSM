package com.fruitsalesplatform.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fruitsalesplatform.dao.CommoditiesDao;
import com.fruitsalesplatform.entity.Commodities;
@Repository
public class CommoditiesDaoImpl extends BaseDaoImpl<Commodities> implements CommoditiesDao{
	public CommoditiesDaoImpl(){
		super.setNs("com.fruitsalesplatform.mapper.CommoditiesMapper");
	}
	public int count(Map map) {
		return this.getSqlSession().selectOne(this.getNs()+".count",map);
	}
}
