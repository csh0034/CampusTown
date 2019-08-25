package com.seoil.campustown.main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoil.campustown.main.service.MainService;
import com.seoil.campustown.store.service.StoreService;

@Controller
public class MainController {
	
	@Resource
	private MainService mainService;
	
	@Resource
	private StoreService storeService;
	
	@RequestMapping("/main.do")
	public String initMain(ModelMap model) throws Exception {
		
		return "user/main/main.tiles";
	}
	
}
