package com.seoil.campustown.persistence;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.seoil.campustown.review.service.impl.ReviewMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/spring/context-datasource.xml", "/com/spring/context-mapper.xml",
		"/com/spring/context-common.xml" })
@Log4j
public class ReviewDeleteTests {

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;

	@Test
	public void deleteReviewServiceList() throws Exception {

		log.info(reviewMapper.selectReviewServiceList(11));
	}
}
