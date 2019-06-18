package com.seoil.campustown.main;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
		"file:src/main/resources/com/spring/*.xml",
		"file:src/main/webapp/WEB-INF/config/action-servlet.xml" })
@Log4j
public class MainControllerTests {

	@Resource
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(
				MockMvcRequestBuilders.get("/main.do")
				.param("a", "b"))
				.andReturn()
				.getModelAndView()
				.getViewName();

		log.info(resultPage);
	}

}
