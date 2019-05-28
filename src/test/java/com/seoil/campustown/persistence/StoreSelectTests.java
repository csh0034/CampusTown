package com.seoil.campustown.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.seoil.campustown.cmmn.util.Criteria;
import com.seoil.campustown.store.service.StoreVO;
import com.seoil.campustown.store.service.impl.StoreMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/spring/context-datasource.xml", "/com/spring/context-mapper.xml",
		"/com/spring/context-common.xml" })
@Log4j
public class StoreSelectTests {

	@Setter(onMethod_ = @Autowired)
	private StoreMapper storeMapper;

	@Test
	public void selectStoreServiceList() throws Exception {
		Criteria criteria = new Criteria();
		criteria.setPage(1);
		criteria.setPerPageNum(10);

		List<StoreVO> storeList = storeMapper.selectStoreServiceList(criteria);

		for (StoreVO storeVO : storeList) {
			log.info(storeVO);
		}
	}
}
