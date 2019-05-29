package com.seoil.campustown.review.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.seoil.campustown.review.service.ReviewService;
import com.seoil.campustown.review.service.ReviewVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class ReviewController {

	@Resource
	private ReviewService reviewService;

	@PostMapping(value = "/reviewAdd.do", produces = "text/plain;charset=UTF-8")
	public String reviewAdd(@RequestBody ReviewVO reviewVO, HttpServletRequest req) throws Exception {

		String u_id = "admin";
		reviewVO.setU_id(u_id);
		// HttpSession session = req.getSession();

		if (u_id.length() == 0) {
			return "로그인 후 이용 가능합니다";
		} else {
			log.info(reviewVO);
			return String.valueOf(reviewService.insertReviewServiceInfo(reviewVO));
		}

	}
}
