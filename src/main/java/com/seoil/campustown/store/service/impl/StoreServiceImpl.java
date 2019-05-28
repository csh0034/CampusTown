package com.seoil.campustown.store.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seoil.campustown.cmmn.util.Criteria;
import com.seoil.campustown.store.service.StoreService;
import com.seoil.campustown.store.service.StoreVO;

@Service
public class StoreServiceImpl implements StoreService {

	@Resource
	private StoreMapper storeMapper;

	@Override
	public StoreVO selectStoreServiceInfo(int s_num) throws Exception {
		return storeMapper.selectStoreServiceInfo(s_num);
	}

	@Override
	public boolean insertStoreServiceInfo(StoreVO storeVO) throws Exception {

		int saveReturn = storeMapper.insertStoreServiceInfo(storeVO);
		boolean success = false;

		if (saveReturn == 1) {
			success = true;
		}

		return success;
	}

	@Override
	public List<StoreVO> selectStoreServiceAllList() throws Exception {
		return storeMapper.selectStoreServiceAllList();
	}

	@Override
	public List<StoreVO> selectStoreServiceList(Criteria criteria) throws Exception {
		return storeMapper.selectStoreServiceList(criteria);
	}
	
	@Override
	public int selectStoreServiceListCount(Criteria criteria) throws Exception {
		return storeMapper.selectStoreServiceListCount(criteria);
	}

	@Override
	public List<Map<String, Object>> selectStoreServiceCategoryList() throws Exception {
		return storeMapper.selectStoreServiceCategoryList();
	}

	@Override
	public boolean updateStoreServiceInfo(StoreVO storeVO) throws Exception {

		int saveReturn = storeMapper.updateStoreServiceInfo(storeVO);
		boolean success = false;

		if (saveReturn == 1) {
			success = true;
		}

		return success;
	}

	@Override
	public boolean deleteStoreServiceInfo(int s_num) throws Exception {

		int saveReturn = storeMapper.deleteStoreServiceInfo(s_num);
		boolean success = false;

		if (saveReturn == 1) {
			success = true;
		}

		return success;
	}

}
