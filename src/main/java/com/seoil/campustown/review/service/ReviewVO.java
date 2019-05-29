package com.seoil.campustown.review.service;

import java.util.Date;
import lombok.Data;

@Data
public class ReviewVO {
	private int rw_num;
	private String u_id;
	private int s_num;
	private String rw_content;
	private int rw_score;
	private Date rw_regdate;
}
