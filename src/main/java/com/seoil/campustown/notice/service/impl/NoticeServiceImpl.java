package com.seoil.campustown.notice.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.seoil.campustown.notice.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Resource
	private NoticeMapper noticeMapper;
}
