package com.seoil.campustown.store.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String StoreInit() throws Exception {

		Map<String, Object> map = storeService.selectStoreServiceInfo();

		log.info(map);

		return "user/store/store.tiles";
	}

	@GetMapping({ "/admin/main.do", "/admin/store.do" })
	public String StoreList(ModelMap model) throws Exception {

		return "admin/store/store.tilesAdmin";
	}

	@GetMapping("/admin/storeAdd.do")
	public String StoreAdd() throws Exception {
		return "admin/store/storeAdd.tilesAdmin";
	}

	@PostMapping("/admin/storeAdd.do")
	public String StoreAdd(@ModelAttribute StoreVO storeVO,
						   RedirectAttributes rttr,
						   MultipartFile[] uploadfile) throws Exception {
		
		boolean success = false;
		String fileName = "";
		
		for (MultipartFile multipartFile : uploadfile) {
			
			if(!multipartFile.isEmpty()) {
				fileName = fileName + multipartFile.getOriginalFilename() + ",";
			}
		}
		
		storeVO.setS_img(fileName);
		
		success = storeService.saveStoreServiceInfo(storeVO);
		
		if(success) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/store.do";
	}
}
