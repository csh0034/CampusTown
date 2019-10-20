package com.seoil.campustown.main.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoil.campustown.cmmn.util.Criteria;
import com.seoil.campustown.cmmn.util.PageMaker;
import com.seoil.campustown.main.service.MainService;
import com.seoil.campustown.notice.service.NoticeService;
import com.seoil.campustown.notice.service.NoticeVO;
import com.seoil.campustown.store.service.StoreService;
import com.seoil.campustown.store.service.StoreVO;

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
		List<StoreVO> storeRecommendList = storeService.selectStoreServiceRecommendList();

		model.addAttribute("noticeRecentInfo", noticeRecentInfo);
		model.addAttribute("storeCategoryList", storeCategoryList);
		model.addAttribute("storeRecommendList", storeRecommendList);

		return "user/main/main.tiles";
	}
	
	@RequestMapping("/search.do")
	public String search(ModelMap model, Criteria criteria) throws Exception {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		
		return "user/search/searchList.tiles";
	}
	
	@RequestMapping("/info.do")
	public String info() throws Exception {
		return "user/info/info.tiles";
	}

}
