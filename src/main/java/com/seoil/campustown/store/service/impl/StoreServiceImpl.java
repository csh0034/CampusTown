package com.seoil.campustown.store.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seoil.campustown.store.service.StoreService;
import com.seoil.campustown.store.service.StoreVO;

@Service
public class StoreServiceImpl implements StoreService {

	@Resource
	private StoreMapper storeMapper;

	@Override
	public Map<String, Object> selectStoreServiceInfo() throws Exception {
		return storeMapper.selectStoreServiceInfo();
	}

	@Override
	public boolean saveStoreServiceInfo(StoreVO storeVO) throws Exception {
		
		int saveReturn = storeMapper.saveStoreServiceInfo(storeVO);
		boolean success = false;
		
		if(saveReturn == 1) {
			success = true;
		}
		
		return success;
	}

}
