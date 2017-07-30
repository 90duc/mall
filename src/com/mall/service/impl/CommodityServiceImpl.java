package com.mall.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.dao.CommodityMapper;
import com.mall.entity.Commodity;
import com.mall.service.CommodityService;
@Service
public class CommodityServiceImpl implements CommodityService {
	@Autowired
	CommodityMapper commodityMapper;
	@Override
	public boolean delete(Integer cid) {
		return (commodityMapper.deleteByPrimaryKey(cid)==1)?true:false;
	}

	@Override
	public boolean insert(Commodity commodity) {
		return (commodityMapper.insert(commodity)==1)?true:false;
	}

	@Override
	public boolean insertSelective(Commodity commodity) {
		return (commodityMapper.insertSelective(commodity)==1)?true:false;
	}

	@Override
	public Commodity select(Integer cid) {
		return commodityMapper.selectByPrimaryKey(cid);
	}

	@Override
	public boolean updateBySelective(Commodity commodity) {
		return (commodityMapper.updateByPrimaryKeySelective(commodity)==1)?true:false;
	}

	@Override
	public boolean update(Commodity commodity) {
		return (commodityMapper.updateByPrimaryKey(commodity)==1)?true:false;
	}

	@Override
	public List<Commodity> selectAll(Integer btid, Integer stid) {
		Map<String,Integer> type=new HashMap<String, Integer>();
		type.put("btid", btid);
		type.put("stid", stid);
		return commodityMapper.selectAll(type);
	}

	@Override
	public List<Commodity> fuzzySearch(String condition) {
		return commodityMapper.fuzzySearch(condition);
	}

	@Override
	public List<Commodity> search(Integer btid, Integer stid, String condition) {
		Map<String,Object> type=new HashMap<String, Object>();
		type.put("btid", btid);
		type.put("stid", stid);
		type.put("condition", condition);
		return commodityMapper.search(type);
	}

}
