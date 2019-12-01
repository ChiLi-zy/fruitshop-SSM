package com.fruitsalesplatform.dao.impl;

import org.springframework.stereotype.Repository;

import com.fruitsalesplatform.dao.AccessoryDao;
import com.fruitsalesplatform.entity.Accessory;
@Repository
public class AccessoryDaoImpl extends BaseDaoImpl<Accessory> implements AccessoryDao {
	public AccessoryDaoImpl(){
		super.setNs("com.fruitsalesplatform.mapper.AccessoryMapper");
	}
}
