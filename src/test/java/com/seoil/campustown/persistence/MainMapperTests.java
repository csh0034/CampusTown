package com.seoil.campustown.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.seoil.campustown.main.service.impl.MainMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/spring/context-datasource.xml", "/com/spring/context-mapper.xml",
		"/com/spring/context-common.xml" })
@Log4j
public class MainMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MainMapper mainMapper;

	@Test
	public void selectMainServiceUserList() throws Exception {
		log.info("selectMainServiceUserList");
		log.info(mainMapper.selectMainServiceUserList());

	}
}
