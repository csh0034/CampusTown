package com.seoil.campustown.notice.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.seoil.campustown.cmmn.util.Criteria;
import com.seoil.campustown.notice.service.NoticeService;


@Controller
public class NoticeController {
	
	@Resource
	private NoticeService noticeService; 
	
	@GetMapping("/notice.do")
	public String noticeInit(ModelMap model, Criteria criteria) throws Exception {
		
		return "user/notice/noticeList.tiles";
	}
}
