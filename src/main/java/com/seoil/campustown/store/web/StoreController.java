package com.seoil.campustown.store.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoil.campustown.store.service.StoreService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class StoreController {
 
	@Resource
	private StoreService storeService;

	@RequestMapping(value = "/store.do")
	public String StoreInit() throws Exception {

		Map<String, Object> map = storeService.selectStoreServiceInfo();

		log.info(map);

		return "user/store/store.tiles";
	}
}
