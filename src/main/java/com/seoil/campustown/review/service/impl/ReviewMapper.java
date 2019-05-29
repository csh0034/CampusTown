package com.seoil.campustown.review.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.seoil.campustown.review.service.ReviewVO;

@Mapper
public interface ReviewMapper {

	List<ReviewVO> selectReviewServiceList(int s_num) throws Exception;

	int insertReviewServiceInfo(ReviewVO reviewVO) throws Exception;
	
	int deleteReviewServiceInfo(int s_num) throws Exception;
}
