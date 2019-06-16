package com.seoil.campustown.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.seoil.campustown.reservation.service.impl.ReservationMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/spring/context-datasource.xml", "/com/spring/context-mapper.xml",
		"/com/spring/context-common.xml" })
@Log4j
public class ReservationMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ReservationMapper reservationMapper;

	@Test
	public void selectReservationServiceList() throws Exception {
		log.info("selectReservationServiceList");
		log.info(reservationMapper.selectReservationServiceList(0));

	}
}
