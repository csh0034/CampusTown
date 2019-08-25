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
			storeVO.setS_name((String)map.get("A"));
			storeVO.setC_num((int) (Math.random() * 7 + 1));
			
			String tel = map.get("B").equals("false") ? "02-0000-0000" : (String)map.get("B");
			storeVO.setS_tel(tel);
			
			String address = map.get("C").equals("false") ? "서울 중랑구 용마산로" : (String)map.get("C");
			storeVO.setS_address(address);
			
			storeVO.setS_hours("09:00~18:00");
			storeVO.setS_content("많은 이용 부탁드립니다.");
			storeVO.setS_hashtag("#서일대");
			
			try {
				storeMapper.insertStoreServiceInfo(storeVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		});


		/*for (int i = 1; i < 110; i++) {
			StoreVO storeVO = new StoreVO();

			storeVO.setS_name("이름" + i);
			storeVO.setC_num((int) (Math.random() * 7 + 1));
			storeVO.setS_tel("02-" + (int) (Math.random() * 2000 + 1) + "-" + (int) (Math.random() * 2000 + 1));
			storeVO.setS_address("주소" + i);
			storeVO.setS_content("점포 소개" + i);
			storeVO.setS_snsurl("facebook/test" + i);
			storeVO.setS_hashtag("#맛집" + i + ", #서일대");
			storeVO.setS_hours("09:00 ~ 17:00");

			storeMapper.insertStoreServiceInfo(storeVO);
		}*/
	}
}
