package com.seoil.campustown.store.service;

import java.util.Map;

public interface StoreService {

	Map<String, Object> selectStoreServiceInfo() throws Exception;

	boolean saveStoreServiceInfo(StoreVO storeVO) throws Exception;

}
