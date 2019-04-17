package com.seoil.campustown.store.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seoil.campustown.store.service.StoreService;

@Service
public class StoreServiceImpl implements StoreService{

	@Resource
	private StoreMapper storeMapper;
	
	@Override
	public Map<String, Object> selectStoreServiceInfo() throws Exception {
		return storeMapper.selectStoreServiceInfo();
	}

}
