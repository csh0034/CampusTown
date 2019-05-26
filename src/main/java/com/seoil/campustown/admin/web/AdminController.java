package com.seoil.campustown.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping({ "/admin/main.do", "/admin/store.do" })
	public String initMain(ModelMap model) throws Exception {

		return "admin/store/store.tilesAdmin";
	}

}
