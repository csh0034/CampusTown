package com.seoil.campustown.store.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seoil.campustown.cmmn.util.Criteria;
import com.seoil.campustown.cmmn.util.PageMaker;
import com.seoil.campustown.review.service.ReviewService;
import com.seoil.campustown.review.service.ReviewVO;
import com.seoil.campustown.store.service.StoreService;
import com.seoil.campustown.store.service.StoreVO;

@Controller
public class StoreController {

	@Resource
	private StoreService storeService;

	@Resource
	private ReviewService reviewService;

	@GetMapping(value = "/store.do")
	public String storeInit(ModelMap model, Criteria criteria) throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(storeService.selectStoreServiceListCount(criteria));

		List<StoreVO> storeList = storeService.selectStoreServiceList(criteria);
		List<Map<String, Object>> storeCategoryList = storeService.selectStoreServiceCategoryList();

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("storeList", storeList);
		model.addAttribute("storeCategoryList", storeCategoryList);

		return "user/store/storeList.tiles";
	}

	@GetMapping(value = "/storeDetail.do")
	public String storeDetail(@RequestParam(defaultValue = "1", required = false) int num, ModelMap model)
			throws Exception {

		StoreVO storeInfo = storeService.selectStoreServiceInfo(num);

		List<ReviewVO> reviewList = reviewService.selectReviewServiceList(num);

		model.addAttribute("storeInfo", storeInfo);
		model.addAttribute("reviewList", reviewList);

		return "user/store/storeDetail.tiles";
	}

	@GetMapping({ "/admin/main.do", "/admin/storeList.do" })
	public String storeList(ModelMap model) throws Exception {

		List<StoreVO> storeList = storeService.selectStoreServiceAllList();

		model.addAttribute("storeList", storeList);

		return "admin/store/storeList.tilesAdmin";
	}

	@GetMapping("/admin/storeAdd.do")
	public String storeAdd(ModelMap model) throws Exception {

		List<Map<String, Object>> storeCategoryList = storeService.selectStoreServiceCategoryList();

		model.addAttribute("storeCategoryList", storeCategoryList);

		return "admin/store/storeDetail.tilesAdmin";
	}

	@PostMapping("/admin/storeAdd.do")
	public String storeAdd(@ModelAttribute StoreVO storeVO, RedirectAttributes rttr, HttpServletRequest req)
			throws Exception {

		int s_num = storeService.insertStoreServiceInfo(storeVO);

		if (s_num > 0) {

			storeService.insertStoreServiceFiles(storeVO.getS_num(), req);

			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/storeList.do";
	}

	@GetMapping("/admin/storeModify.do")
	public String storeModify(@RequestParam(defaultValue = "1", required = false) int num, ModelMap model)
			throws Exception {

		List<Map<String, Object>> storeCategoryList = storeService.selectStoreServiceCategoryList();
		List<Map<String, Object>> storeFileList = storeService.selectStoreServiceFileList(num);
		StoreVO storeInfo = storeService.selectStoreServiceInfo(num);

		model.addAttribute("storeCategoryList", storeCategoryList);
		model.addAttribute("storeFileList", storeFileList);
		model.addAttribute("storeInfo", storeInfo);

		return "admin/store/storeModify.tilesAdmin";
	}

	@PostMapping("/admin/storeModify.do")
	public String storeModify(@ModelAttribute StoreVO storeVO, RedirectAttributes rttr, HttpServletRequest req)
			throws Exception {

		boolean success = false;
		String redirect = "redirect:/admin/storeList.do";

		success = storeService.updateStoreServiceInfo(storeVO);

		if (success) {

			storeService.insertStoreServiceFiles(storeVO.getS_num(), req);

			rttr.addFlashAttribute("result", "success");
		}

		return redirect;
	}

	@GetMapping("/admin/storeDelete.do")
	public String storeDelete(@RequestParam(defaultValue = "1", required = false) int num, RedirectAttributes rttr,
			HttpServletRequest req) throws Exception {

		storeService.deleteStoreServiceFileList(num, req);
		
		boolean success = storeService.deleteStoreServiceInfo(num);

		if (success) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/storeList.do";
	}

	@GetMapping(value = "/admin/storeFileDelete.do")
	@ResponseBody
	public String storeFileDelete(HttpServletRequest req) throws Exception {

		storeService.deleteStoreServiceFileInfo(req);

		return "good";
	}
}
