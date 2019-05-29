package com.seoil.campustown.review.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seoil.campustown.review.service.ReviewService;
import com.seoil.campustown.review.service.ReviewVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ReviewController {

	@Resource
	private ReviewService reviewService;

	@PostMapping(value = "/reviewAdd.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
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

	@GetMapping("/admin/reviewList.do")
	public String StoreList(ModelMap model) throws Exception {

		List<ReviewVO> reviewList = reviewService.selectReviewServiceList(0);

		model.addAttribute("reviewList", reviewList);

		return "admin/review/reviewList.tilesAdmin";
	}

	@GetMapping("/admin/reviewDelete.do")
	public String reviewDelete(@RequestParam(defaultValue = "1", required = false) int num, RedirectAttributes rttr)
			throws Exception {

		int count = 0;

		count = reviewService.deleteReviewServiceInfo(num);

		if (count == 1) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/reviewList.do";
	}

}
