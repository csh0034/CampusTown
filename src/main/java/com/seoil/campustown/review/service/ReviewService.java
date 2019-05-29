package com.seoil.campustown.review.service;

import java.util.List;

public interface ReviewService {
	
	List<ReviewVO> selectReviewServiceList(int s_num) throws Exception;

	int insertReviewServiceInfo(ReviewVO reviewVO) throws Exception;
	
	int deleteReviewServiceInfo(int s_num) throws Exception;
}
