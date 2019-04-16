package com.seoil.campustown.main.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainMapper {
	
	public List<HashMap<String, Object>> selectMainServiceUserList() throws Exception;
}
