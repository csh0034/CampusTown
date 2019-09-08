package com.seoil.campustown.persistence;

import java.io.File;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.seoil.campustown.cmmn.util.ExcelUtils;
import com.seoil.campustown.store.service.StoreVO;
import com.seoil.campustown.store.service.impl.StoreMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/spring/context-datasource.xml", "/com/spring/context-mapper.xml",
		"/com/spring/context-common.xml" })
public class StoreCreateTests {

	@Setter(onMethod_ = @Autowired)
	private StoreMapper storeMapper;

	@Test
	public void insertStoreServiceInfo() throws Exception {

		File file = new ClassPathResource("excel/campustown.xlsx").getFile();

		log.info("excelToMapList");
		ExcelUtils.excelToMapList(file.getAbsolutePath()).forEach(map -> {

			log.info(map);

			StoreVO storeVO = new StoreVO();
			storeVO.setS_name((String) map.get("A"));

			String category = (String) map.get("D");

			switch (category) {
			case "음식점":
				storeVO.setC_num(1);
				break;
			case "카페":
				storeVO.setC_num(2);
				break;
			case "오락":
				storeVO.setC_num(3);
				break;
			case "잡화":
				storeVO.setC_num(4);
				break;
			case "편의":
				storeVO.setC_num(5);
				break;
			case "기타":
				storeVO.setC_num(6);
				break;
			default:
				break;
			}

			String tel = map.get("B").equals("false") ? "02-0000-0000" : (String) map.get("B");
			storeVO.setS_tel(tel);

			String address = map.get("C").equals("false") ? "서울 중랑구 용마산로" : (String) map.get("C");
			storeVO.setS_address(address);

			storeVO.setS_hours("09:00~18:00");
			storeVO.setS_content("많은 이용 부탁드립니다.");

			if ("음식점".equals(category) && !map.get("E").equals("false")) {
				storeVO.setS_hashtag("#서일대,#" + map.get("E"));
			} else {
				storeVO.setS_hashtag("#서일대");
			}

			try {
				storeMapper.insertStoreServiceInfo(storeVO);
			} catch (Exception e) {
				e.printStackTrace();
			}

		});

	}
}
