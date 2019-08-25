package com.seoil.campustown.notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.seoil.campustown.cmmn.util.Criteria;

public interface NoticeService {

	NoticeVO selectNoticeServiceInfo(int n_num) throws Exception;

	List<NoticeVO> selectNoticeServiceAllList() throws Exception;

	List<NoticeVO> selectNoticeServiceList(Criteria criteria) throws Exception;

	int selectNoticeServiceListCount(Criteria criteria) throws Exception;

	int insertNoticeServiceInfo(NoticeVO noticeVO) throws Exception;

	void updateNoticeServiceHitInfo(int num) throws Exception;

	boolean updateNoticeServiceInfo(NoticeVO noticeVO) throws Exception;

	int updateNoticeServiceFileInfo(HttpServletRequest req) throws Exception;

	boolean deleteNoticeServiceInfo(int n_num, HttpServletRequest req) throws Exception;
	
	List<NoticeVO> selectNoticeServiceRecentInfo() throws Exception;

}
