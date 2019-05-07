package com.seoil.campustown.main.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seoil.campustown.main.service.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Resource
	private MainMapper mainMapper;

	@Override
	public List<HashMap<String, Object>> selectMainServiceUserList() throws Exception {
		
		return mainMapper.selectMainServiceUserList();
	}

}
