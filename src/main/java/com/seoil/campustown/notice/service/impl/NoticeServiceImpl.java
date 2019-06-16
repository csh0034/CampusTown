package com.seoil.campustown.notice.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.seoil.campustown.cmmn.util.Criteria;
import com.seoil.campustown.cmmn.util.CustomFileUtil;
import com.seoil.campustown.notice.service.NoticeService;
import com.seoil.campustown.notice.service.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Resource
	private NoticeMapper noticeMapper;

	@Override
	public NoticeVO selectNoticeServiceInfo(int n_num) throws Exception {
		return noticeMapper.selectNoticeServiceInfo(n_num);
	}

	@Override
	public List<NoticeVO> selectNoticeServiceAllList() throws Exception {
		return noticeMapper.selectNoticeServiceAllList();
	}

	@Override
	public List<NoticeVO> selectNoticeServiceList(Criteria criteria) throws Exception {
		return noticeMapper.selectNoticeServiceList(criteria);
	}

	@Override
	public int selectNoticeServiceListCount(Criteria criteria) throws Exception {
		return noticeMapper.selectNoticeServiceListCount(criteria);
	}

	@Override
	public int insertNoticeServiceInfo(NoticeVO noticeVO) throws Exception {
		return noticeMapper.insertNoticeServiceInfo(noticeVO);
	}

	@Override
	public void updateNoticeServiceHitInfo(int num) throws Exception {
		noticeMapper.updateNoticeServiceHitInfo(num);
	}

	@Override
	public boolean updateNoticeServiceInfo(NoticeVO noticeVO) throws Exception {
		return noticeMapper.updateNoticeServiceInfo(noticeVO);
	}

	@Override
	public int updateNoticeServiceFileInfo(HttpServletRequest req) throws Exception {

		int n_num = Integer.parseInt(req.getParameter("n_num"));
		String n_attach = req.getParameter("n_attach");

		int count = noticeMapper.updateNoticeServiceFileInfo(n_num);

		if (count > 0) {
			CustomFileUtil.deleteFile(n_attach, req);
		}

		return count;
	}

	@Override
	public boolean deleteNoticeServiceInfo(int n_num, HttpServletRequest req) throws Exception {

		NoticeVO noticeVO = noticeMapper.selectNoticeServiceInfo(n_num);
		
		if (noticeVO.getN_attach() != null && !"".equals(noticeVO.getN_attach())) {
			CustomFileUtil.deleteFile(noticeVO.getN_attach(), req);
		}

		return noticeMapper.deleteNoticeServiceInfo(n_num);
	}
}
