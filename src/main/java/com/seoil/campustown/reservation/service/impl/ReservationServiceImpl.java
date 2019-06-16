package com.seoil.campustown.reservation.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.seoil.campustown.reservation.service.ReservationService;
import com.seoil.campustown.reservation.service.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Resource
	private ReservationMapper reservationMapper;
	
	@Override
	public List<ReservationVO> selectReservationServiceList(int s_num) throws Exception {
		return reservationMapper.selectReservationServiceList(s_num);
	}
	
	@Override
	public int insertReservationServiceInfo(ReservationVO reservationVO) throws Exception {
		return reservationMapper.insertReservationServiceInfo(reservationVO);
	}


	@Override
	public int deleteReservationServiceInfo(int rn_num) throws Exception {
		return reservationMapper.deleteReservationServiceInfo(rn_num);
	}

}
