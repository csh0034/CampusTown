package com.seoil.campustown.review.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seoil.campustown.review.service.ReviewService;
import com.seoil.campustown.review.service.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Resource
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> selectReviewServiceList(int s_num) throws Exception {
		return reviewMapper.selectReviewServiceList(s_num);
	}

	@Override
	public int insertReviewServiceInfo(ReviewVO reviewVO) throws Exception {
		return reviewMapper.insertReviewServiceInfo(reviewVO);
	}

	@Override
	public int deleteReviewServiceInfo(int s_num) throws Exception {
		return reviewMapper.deleteReviewServiceInfo(s_num);
	}
	
	

}
