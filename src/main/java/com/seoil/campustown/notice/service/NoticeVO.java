package com.seoil.campustown.notice.service;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int n_num;
	private String n_type;
	private String n_url;
	private String n_title;
	private String n_content;
	private Date n_regdate;
	private int n_hit;
	private String n_attach;
}
