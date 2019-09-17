package com.seoil.campustown.store.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import com.seoil.campustown.cmmn.util.Criteria;

public interface StoreService {

	StoreVO selectStoreServiceInfo(int s_num) throws Exception;

	int insertStoreServiceInfo(StoreVO storeVO) throws Exception;

	List<StoreVO> selectStoreServiceAllList() throws Exception;

	List<StoreVO> selectStoreServiceList(Criteria criteria) throws Exception;

	int selectStoreServiceListCount(Criteria criteria) throws Exception;

	List<Map<String, Object>> selectStoreServiceCategoryList() throws Exception;

	boolean updateStoreServiceInfo(StoreVO storeVO) throws Exception;

	boolean deleteStoreServiceInfo(int s_num) throws Exception;

	int insertStoreServiceFiles(int s_num, HttpServletRequest req) throws Exception;

	List<Map<String, Object>> selectStoreServiceFileList(int s_num) throws Exception;

	int deleteStoreServiceFileInfo(HttpServletRequest req) throws Exception;

	int deleteStoreServiceFileList(int s_num, HttpServletRequest req) throws Exception;

	List<StoreVO> selectStoreServiceBestList() throws Exception;
	
	List<StoreVO> selectStoreServiceRecommendList() throws Exception;

}
