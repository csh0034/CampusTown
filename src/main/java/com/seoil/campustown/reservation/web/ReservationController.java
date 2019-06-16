package com.seoil.campustown.reservation.web;

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

import com.seoil.campustown.reservation.service.ReservationService;
import com.seoil.campustown.reservation.service.ReservationVO;
import com.seoil.campustown.user.service.UserVO;

@Controller
public class ReservationController {

	@Resource
	private ReservationService reservationService;
	

	@PostMapping(value = "/reservationAdd.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String reservationAdd(@RequestBody ReservationVO reservationVO, HttpServletRequest req) throws Exception {

		UserVO userVO = (UserVO) req.getSession().getAttribute("user");
		
		if (userVO == null) {
			return "로그인 후 이용 가능합니다";
		} else {
			reservationVO.setU_id(userVO.getU_id());
			
			return String.valueOf(reservationService.insertReservationServiceInfo(reservationVO));
		}

	}
	
	@GetMapping("/admin/reservationList.do")
	public String reservationInit(ModelMap model) throws Exception {
		
		List<ReservationVO> reservationList = reservationService.selectReservationServiceList(0);
		
		model.addAttribute("reservationList", reservationList);
		
		return "admin/reservation/reservationList.tilesAdmin";
	}
	
	@GetMapping("/admin/reservationDelete.do")
	@ResponseBody
	public String reservationDelete(@RequestParam(defaultValue = "1", required = false) int rn_num, RedirectAttributes rttr)
			throws Exception {

		int count = reservationService.deleteReservationServiceInfo(rn_num);

		return String.valueOf(count);
	}
}
