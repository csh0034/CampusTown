package com.seoil.campustown.reservation.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seoil.campustown.reservation.service.ReservationService;
import com.seoil.campustown.reservation.service.ReservationVO;

@Controller
public class ReservationController {

	@Resource
	private ReservationService reservationService;
	
	@GetMapping("/admin/reservationList.do")
	public String reservationInit(ModelMap model) throws Exception {
		
		List<ReservationVO> reservationList = reservationService.selectReservationServiceList(0);
		
		model.addAttribute("reservationList", reservationList);
		
		return "admin/reservation/reservationList.tilesAdmin";
	}
	
	@GetMapping("/admin/reservationDelete.do")
	@ResponseBody
	public String reviewDelete(@RequestParam(defaultValue = "1", required = false) int rn_num, RedirectAttributes rttr)
			throws Exception {

		int count = reservationService.deleteReservationServiceInfo(rn_num);

		return String.valueOf(count);
	}
}
