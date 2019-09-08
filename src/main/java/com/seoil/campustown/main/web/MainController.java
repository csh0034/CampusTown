package com.seoil.campustown.main.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoil.campustown.main.service.MainService;
import com.seoil.campustown.notice.service.NoticeService;
import com.seoil.campustown.notice.service.NoticeVO;
import com.seoil.campustown.store.service.StoreService;

@Controller
public class MainController {
	
	@Resource
	private MainService mainService;
	
	@Resource
	private NoticeService noticeService;
	
	@Resource
	private StoreService storeService;
	
	@RequestMapping("/main.do")
	public String initMain(ModelMap model) throws Exception {
		
		List<NoticeVO> noticeRecentInfo = noticeService.selectNoticeServiceRecentInfo();
		List<Map<String, Object>> storeCategoryList = storeService.selectStoreServiceCategoryList();
		
		model.addAttribute("noticeRecentInfo", noticeRecentInfo);
		model.addAttribute("storeCategoryList", storeCategoryList);
		
		return "user/main/main.tiles";
	}
	
}
