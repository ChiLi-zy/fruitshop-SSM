package com.fruitsalesplatform.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.fruitsalesplatform.entity.Commodities;

public interface CommoditiesService {
	public Commodities get(Serializable id);//只查询一个数据，常用于修改
	public List<Commodities> find(Map map);//根据条件查询多个数据
	public void insert(Commodities commodities);//插入 用实体作为参数
	public void update(Commodities commodities);//修改 用实体作为参数
	public void deleteById(Serializable id);//按id删除  删除一条数据  支持整形和字符串类型数据id
	public void delete(Serializable[] ids);//批量删除 支持整形和字符串类型数据id
	public int count(Map map);//根据条件统计结果集数量
}		
