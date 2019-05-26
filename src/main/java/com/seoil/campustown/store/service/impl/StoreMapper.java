package com.seoil.campustown.store.service.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.seoil.campustown.store.service.StoreVO;

@Mapper
public interface StoreMapper {

	Map<String, Object> selectStoreServiceInfo() throws Exception;

	int saveStoreServiceInfo(StoreVO storeVO) throws Exception;

}
