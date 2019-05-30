package com.seoil.campustown.store.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.seoil.campustown.cmmn.util.Criteria;
import com.seoil.campustown.store.service.StoreVO;

@Mapper
public interface StoreMapper {

	StoreVO selectStoreServiceInfo(int s_num) throws Exception;

	int insertStoreServiceInfo(StoreVO storeVO) throws Exception;

	List<StoreVO> selectStoreServiceAllList() throws Exception;

	List<StoreVO> selectStoreServiceList(Criteria criteria) throws Exception;

	int selectStoreServiceListCount(Criteria criteria) throws Exception;

	List<Map<String, Object>> selectStoreServiceCategoryList() throws Exception;

	int updateStoreServiceInfo(StoreVO storeVO) throws Exception;

	int deleteStoreServiceInfo(int s_num) throws Exception;

	int insertStoreServiceFiles(List<Map<String, Object>> uploadList) throws Exception;

	List<Map<String, Object>> selectStoreServiceFileList(int s_num) throws Exception;

	int deleteStoreServiceFileInfo(int si_num) throws Exception;
	
	int deleteStoreServiceFileList(int s_num) throws Exception;

}
