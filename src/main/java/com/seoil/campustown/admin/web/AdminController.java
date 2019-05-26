package com.seoil.campustown.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping({ "/admin/main.do", "/admin/store.do" })
	public String StoreList(ModelMap model) throws Exception {

		return "admin/store/store.tilesAdmin";
	}
	
	@RequestMapping("/admin/storeAdd.do")
	public String StoreAdd(ModelMap model) throws Exception {

		return "admin/store/storeAdd.tilesAdmin";
	}

}
