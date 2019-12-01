package com.fruitsalesplatform.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruitsalesplatform.dao.AccessoryDao;
import com.fruitsalesplatform.entity.Accessory;
import com.fruitsalesplatform.service.AccessoryService;

@Service
public class AccessoryServiceImpl implements AccessoryService {
	@Autowired
	AccessoryDao accessoryDao;
	@Override
	public void add(Accessory accessory) {
		accessoryDao.insert(accessory);
	}

	@Override
	public void delete(String id) {
		accessoryDao.deleteById(id);
	}

	@Override
	public void deleteList(Serializable[] ids) {
		accessoryDao.delete(ids);
	}

	@Override
	public List<Accessory> findAll(Map map) {
		return accessoryDao.find(map);
	}
	
}
