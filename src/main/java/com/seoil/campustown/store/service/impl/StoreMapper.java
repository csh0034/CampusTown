package com.seoil.campustown.store.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.seoil.campustown.store.service.StoreVO;

@Mapper
public interface StoreMapper {

	StoreVO selectStoreServiceInfo(int s_num) throws Exception;

	int insertStoreServiceInfo(StoreVO storeVO) throws Exception;

	List<StoreVO> selectStoreServiceList() throws Exception;

	List<Map<String, Object>> selectStoreServiceCategoryList() throws Exception;

	int updateStoreServiceInfo(StoreVO storeVO) throws Exception;

	int deleteStoreServiceInfo(int s_num) throws Exception;

}
