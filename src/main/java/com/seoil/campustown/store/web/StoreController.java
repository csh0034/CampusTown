package com.seoil.campustown.store.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seoil.campustown.store.service.StoreService;
import com.seoil.campustown.store.service.StoreVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class StoreController {

	@Resource
	private StoreService storeService;

	@GetMapping(value = "/store.do")
	public String StoreInit(ModelMap model) throws Exception {

		List<StoreVO> storeList = storeService.selectStoreServiceList();

		model.addAttribute("storeList", storeList);

		log.info(storeList);

		return "user/store/storeList.tiles";
	}

	@GetMapping(value = "/storeDetail.do")
	public String StoreDetail(@RequestParam(defaultValue = "1", required = false) int num, ModelMap model)
			throws Exception {
		
		StoreVO storeInfo = storeService.selectStoreServiceInfo(num);

		model.addAttribute("storeInfo", storeInfo);

		return "user/store/storeDetail.tiles";
	}

	@GetMapping({ "/admin/main.do", "/admin/storeList.do" })
	public String StoreList(ModelMap model) throws Exception {

		List<StoreVO> storeList = storeService.selectStoreServiceList();

		model.addAttribute("storeList", storeList);

		return "admin/store/storeList.tilesAdmin";
	}

	@GetMapping("/admin/storeAdd.do")
	public String StoreAdd(ModelMap model) throws Exception {

		List<Map<String, Object>> storeCategoryList = storeService.selectStoreServiceCategoryList();

		model.addAttribute("storeCategoryList", storeCategoryList);

		return "admin/store/storeDetail.tilesAdmin";
	}

	@PostMapping("/admin/storeAdd.do")
	public String StoreAdd(@ModelAttribute StoreVO storeVO, RedirectAttributes rttr, MultipartFile[] uploadfile)
			throws Exception {

		boolean success = false;
		String fileName = "";

		for (MultipartFile multipartFile : uploadfile) {

			if (!multipartFile.isEmpty()) {
				fileName = fileName + multipartFile.getOriginalFilename() + ",";
			}
		}

		success = storeService.insertStoreServiceInfo(storeVO);

		if (success) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/storeList.do";
	}

	@GetMapping("/admin/storeModify.do")
	public String StoreModify(@RequestParam(defaultValue = "1", required = false) int num, ModelMap model)
			throws Exception {

		List<Map<String, Object>> storeCategoryList = storeService.selectStoreServiceCategoryList();
		StoreVO storeInfo = storeService.selectStoreServiceInfo(num);

		model.addAttribute("storeCategoryList", storeCategoryList);
		model.addAttribute("storeInfo", storeInfo);

		return "admin/store/storeModify.tilesAdmin";
	}

	@PostMapping("/admin/storeModify.do")
	public String StoreModify(@ModelAttribute StoreVO storeVO, RedirectAttributes rttr) throws Exception {

		boolean success = false;
		String redirect = "redirect:/admin/storeList.do";

		success = storeService.updateStoreServiceInfo(storeVO);

		if (success) {
			rttr.addFlashAttribute("result", "success");
		}

		return redirect;
	}

	@GetMapping("/admin/storeDelete.do")
	public String StoreDelete(@RequestParam(defaultValue = "1", required = false) int num, RedirectAttributes rttr)
			throws Exception {

		boolean success = false;

		success = storeService.deleteStoreServiceInfo(num);

		if (success) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/storeList.do";
	}
}
