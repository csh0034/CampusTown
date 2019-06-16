package com.seoil.campustown.reservation.service;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationVO {
	 private int rn_num;
	 private String u_id;
	 private int s_num;
	 private int rn_count;
	 private Date rn_date;
	 private Date rn_regdate;
	 private String rn_content;
	 private String rn_name;
	 private String s_name;
}
