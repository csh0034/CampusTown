package com.seoil.campustown.main.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoil.campustown.main.service.MainService;

@Controller
public class MainController {
	
	@Resource
	private MainService mainService;
	
	@RequestMapping("/main.do")
	public String initMain(ModelMap model) throws Exception {
		
		List<HashMap<String,Object>> mainUserList = mainService.selectMainServiceUserList();
		
		model.addAttribute("mainUserList", mainUserList);
		
		return "main/main.tiles";
	}
	
}
