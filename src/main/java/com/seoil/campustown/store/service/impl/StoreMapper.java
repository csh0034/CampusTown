package com.seoil.campustown.store.service.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreMapper {

	Map<String, Object> selectStoreServiceInfo() throws Exception;

}
