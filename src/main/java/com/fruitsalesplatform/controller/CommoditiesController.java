package com.fruitsalesplatform.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.fruitsalesplatform.entity.Commodities;
import com.fruitsalesplatform.service.CommoditiesService;

@Controller
public class CommoditiesController {
	@Autowired
	CommoditiesService commoditiesService;
	//跳转至列表页面
	/*@RequestMapping("/commodities/list.action")
	public String list(){
		return "/commoditiesHome.jsp";//转向货物信息首页
	}*/
	//跳转至列表页面
	@RequestMapping("commodities/list.action")
	public String list(Model model,Commodities commodities,
			@RequestParam(defaultValue="0.0") double startPrice,
			@RequestParam(defaultValue="0.0") double endPrice,
			String startTime,String endTime){
		System.out.println("commodities----"+commodities);
		Map<String,Object> map=this.CommoditiesToMap(commodities);
		System.out.println("commodities_map----"+map);
		if(startTime!=null&&!startTime.equals("")){
			map.put("startTime", startTime);
		}
		if(endTime!=null&&!endTime.equals("")){
			map.put("endTime", endTime);
		}
		if(startPrice>0.0){
			map.put("startPrice", startPrice);
		}
		if(endPrice>0.0){
			map.put("endPrice", endPrice);
		}
		List<Commodities> commoditiesList=commoditiesService.find(map);
		
		System.out.println("commoditiesList----"+commoditiesList);
		model.addAttribute("commodities", commodities);//搜索条件回显
		model.addAttribute("startPrice", startPrice);//搜索条件回显价值区间
		model.addAttribute("endPrice", endPrice);
		model.addAttribute("startTime", startTime);//搜索条件回显时间区间
		model.addAttribute("endTime", endTime);
		model.addAttribute("list", commoditiesList.size()<1?null:commoditiesList);//三目表达式
		model.addAttribute("currentPage", commodities.getCurrentPage());//当前页数
		model.addAttribute("startPage", commodities.getStartPage());
		int countNumber=commoditiesService.count(map);
		model.addAttribute("countNumber", countNumber);//数据总和
		int pageSize=commodities.getPageSize();
		model.addAttribute("pageSize", pageSize);//每页数据
		int sumPageNumber=countNumber%pageSize==0?(countNumber/pageSize):((countNumber/pageSize)+1);
		model.addAttribute("sumPageNumber", sumPageNumber);//总页数
		return "/Commodities/commoditiesHome.jsp";//转向首页
		
	}
	private Map<String, Object> CommoditiesToMap(Commodities commodities) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name", checkStringIsEmpty(commodities.getName()));
		map.put("locality", checkStringIsEmpty(commodities.getLocality()));
		map.put("createTime",checkStringIsEmpty(commodities.getCreateTime()));
		map.put("startPage", commodities.getStartPage());
		map.put("pageSize", commodities.getPageSize());
		return map;
	}
	private String checkStringIsEmpty(String param){
		return param==null?null:(param.equals("")?null:"%"+param+"%");
	}
	
	@RequestMapping("/commodities/editCommodities.action")
	public @ResponseBody Commodities editCommodities(@RequestBody String json)
	{
		String id=JSONObject.parseObject(json).getString("id");
		
		System.out.println("edit_fruitId-------------"+id);
		//@ResponseBody将Commodities转化为JSON格式输出
		return commoditiesService.get(id);
	}
	@RequestMapping("/commodities/edit.action")
	public String edit(Model model,Commodities commodities){
		System.out.println("updateCommodities-----------"+commodities);
		commoditiesService.update(commodities);
		//构建新得查询条件，只需要分页
		Commodities queryCommodities=new Commodities();
		queryCommodities.setStartPage(commodities.getStartPage());
		queryCommodities.setCurrentPage(commodities.getCurrentPage());
		queryCommodities.setPageSize(commodities.getPageSize());
		model.addAttribute("Msg","<script> alert('修改成功！')</script>");
		return list(model,queryCommodities,0.0,0.0,null,null);
	}
	
	
	@RequestMapping("/commodities/add.action")
	public String add(Model model,Commodities commodities)
	{
		commodities.setFruitId(UUID.randomUUID().toString());
		commodities.setCreateTime(
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())
				);
		System.out.println("commodities------------"+commodities);
		commoditiesService.insert(commodities);
		model.addAttribute("Msg","<script> alert('插入成功！')</script>");
		
		return list(model,new Commodities(),0.0,0.0,null,null);
	}
	
	
	
	
	@RequestMapping("/commodities/delete.action")
	public String delete (Model model,Commodities commodities){
		commoditiesService.deleteById(commodities.getFruitId());
		//构建新的查询列表
		Commodities queryCommodities=new Commodities();
		queryCommodities.setStartPage(commodities.getStartPage());
		queryCommodities.setCurrentPage(commodities.getCurrentPage());
		queryCommodities.setPageSize(commodities.getPageSize());
		model.addAttribute("Msg","<script> alert('删除成功！')</script>");
		return list(model,queryCommodities,0.0,0.0,null,null);
	}
}
