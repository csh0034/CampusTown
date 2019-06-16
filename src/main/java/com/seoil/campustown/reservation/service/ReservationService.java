package com.seoil.campustown.reservation.service;

import java.util.List;


public interface ReservationService {

	List<ReservationVO> selectReservationServiceList(int s_num) throws Exception;
	
	int insertReservationServiceInfo(ReservationVO reservationVO) throws Exception;

	int deleteReservationServiceInfo(int rn_num) throws Exception;

}
