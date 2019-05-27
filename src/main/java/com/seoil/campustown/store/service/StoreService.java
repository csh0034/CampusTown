package com.seoil.campustown.store.service;

import java.util.List;
import java.util.Map;

public interface StoreService {

	StoreVO selectStoreServiceInfo(int s_num) throws Exception;

	boolean insertStoreServiceInfo(StoreVO storeVO) throws Exception;

	List<StoreVO> selectStoreServiceList() throws Exception;
	
	List<Map<String, Object>> selectStoreServiceCategoryList() throws Exception;

	boolean updateStoreServiceInfo(StoreVO storeVO) throws Exception;

	boolean deleteStoreServiceInfo(int s_num) throws Exception;

}
