package com.fruitsalesplatform.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fruitsalesplatform.entity.Accessory;


public interface AccessoryService{
	public void add(Accessory accessory);
	public void delete(String id);
	public void deleteList(Serializable[] ids);
	public List<Accessory> findAll(Map map);
}
