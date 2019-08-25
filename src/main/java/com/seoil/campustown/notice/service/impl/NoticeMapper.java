package com.seoil.campustown.notice.service.impl;

import java.util.List;

import com.seoil.campustown.cmmn.util.Criteria;
import com.seoil.campustown.notice.service.NoticeVO;

public interface NoticeMapper {
	NoticeVO selectNoticeServiceInfo(int n_num) throws Exception;

	List<NoticeVO> selectNoticeServiceAllList() throws Exception;

	List<NoticeVO> selectNoticeServiceList(Criteria criteria) throws Exception;

	int selectNoticeServiceListCount(Criteria criteria) throws Exception;

	int insertNoticeServiceInfo(NoticeVO noticeVO) throws Exception;

	void updateNoticeServiceHitInfo(int n_num) throws Exception;

	boolean updateNoticeServiceInfo(NoticeVO noticeVO) throws Exception;

	int updateNoticeServiceFileInfo(int n_num) throws Exception;

	boolean deleteNoticeServiceInfo(int n_num) throws Exception;

	List<NoticeVO> selectNoticeServiceRecentInfo() throws Exception;

}
