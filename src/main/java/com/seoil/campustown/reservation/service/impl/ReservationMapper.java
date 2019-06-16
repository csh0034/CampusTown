package com.seoil.campustown.reservation.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.seoil.campustown.reservation.service.ReservationVO;

@Mapper
public interface ReservationMapper {

	List<ReservationVO> selectReservationServiceList(int s_num) throws Exception;

	int deleteReservationServiceInfo(int rn_num) throws Exception;

}
