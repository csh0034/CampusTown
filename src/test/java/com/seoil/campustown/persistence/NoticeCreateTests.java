package com.seoil.campustown.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.seoil.campustown.notice.service.NoticeVO;
import com.seoil.campustown.notice.service.impl.NoticeMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/spring/context-datasource.xml", "/com/spring/context-mapper.xml",
		"/com/spring/context-common.xml" })
public class NoticeCreateTests {

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper noticeMapper;

	@Test
	public void insertStoreServiceInfo() throws Exception {

		for (int i = 1; i < 110; i++) {
			NoticeVO noticeVO = new NoticeVO();
			
			noticeVO.setN_title("title"+i);
			noticeVO.setN_content("content"+i);
			noticeVO.setN_attach("attach"+i);
			
			noticeMapper.insertNoticeServiceInfo(noticeVO);
		}
	}
}
