package com.seoil.campustown.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.seoil.campustown.store.service.StoreVO;
import com.seoil.campustown.store.service.impl.StoreMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/spring/context-datasource.xml", "/com/spring/context-mapper.xml",
		"/com/spring/context-common.xml" })
public class StoreCreateTests {

	@Setter(onMethod_ = @Autowired)
	private StoreMapper storeMapper;

	@Test
	public void insertStoreServiceInfo() throws Exception {

		for (int i = 37; i < 90; i++) {
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
		}
	}
}
