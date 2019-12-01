package com.fruitsalesplatform.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fruitsalesplatform.entity.Accessory;
import com.fruitsalesplatform.service.AccessoryService;


@Controller
public class AccessoryController extends BaseController{
	@Resource
	AccessoryService accessoryService;
	
	//增加
	@RequestMapping(value="/accessory/add.action",method=RequestMethod.POST)
	public String add(Model model,Accessory accessory) {
		// TODO Auto-generated method stub
		accessory.setAccessoryId(UUID.randomUUID().toString());
		accessory.setFruitId(accessory.getFruitId());
		accessory.setCreateTime(
					new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())
				);
		accessoryService.add(accessory);
		return list(model, accessory);
	}
	
	//查询
	@RequestMapping(value="accessory/list.action",method=RequestMethod.GET)
	public String list(Model model, Accessory accessory){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("fruitId", accessory.getFruitId());
		List<Accessory> accessoryList=accessoryService.findAll(map);
		model.addAttribute("AccessoryId", accessory.getAccessoryId());
		model.addAttribute("fruitId", accessory.getFruitId());
		model.addAttribute("list", accessoryList.size()<1?null:accessoryList);
		//计算附属品的总价格 并将价格添加到model中
		model.addAttribute("sumPrice", SumPrice(accessoryList));
		return "/accessory/accessoryHome.jsp";
	}
	
	private Object SumPrice(List<Accessory> accessoryList) {
		double sum=0.0;
		for (Accessory accessory:accessoryList) {
			sum+=accessory.getPrice();
		}
		return sum;
	}

	//单条删除
	@RequestMapping("/accessory/delete.action")
	public String delete(Model model,Accessory accessory) {
		
		accessoryService.delete(accessory.getAccessoryId());
		//重新刷新列表
		return list(model, accessory);

	}
	//多条删除
	@RequestMapping("/accessory/deleteList.action")
	public String deleteList(Model model,String[] arrays,Accessory accessory) {
		System.out.println("////////////"+arrays);
		accessoryService.deleteList(arrays);
		return list(model,accessory);

	}
	
	
}
