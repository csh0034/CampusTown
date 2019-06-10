package com.seoil.campustown.user.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seoil.campustown.user.service.UserService;
import com.seoil.campustown.user.service.UserVO;

@Controller
public class UserController {
	
	@Resource
	private UserService userService;
	
	@PostMapping("/login.do")
	@ResponseBody
	public String login(UserVO userVO, HttpServletRequest req) throws Exception {
		
		userVO = userService.selectUserServiceInfo(userVO);
		
		if(userVO != null) {
			req.getSession().setAttribute("user", userVO);
			return "true";
		} else {
			return "false";
		}
		
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest req) throws Exception {
		
		req.getSession().removeAttribute("user");
		
		return "redirect:/";
	}
	
	@GetMapping("/join.do")
	public String join() throws Exception {
		return "user/main/join.tiles";
	}
	
	@PostMapping("/join.do")
	@ResponseBody
	public String join(UserVO userVO) throws Exception {
		
		int cnt = userService.insertUserServiceInfo(userVO);
		
		if(cnt == 1) {
			return "true";

		} else {
			return "false";
		}
		
	}
	
	@GetMapping("/admin/userList.do")
	public String userList(ModelMap model) throws Exception {
		
		List<UserVO> userList = userService.selectUserServiceList();
		
		model.addAttribute("userList", userList);
		
		return "admin/user/userList.tilesAdmin";
	}
	
	@GetMapping("/admin/userDelete.do")
	public String reviewDelete(@RequestParam(required = false) String u_id, RedirectAttributes rttr)
			throws Exception {

		userService.deleteUserServiceInfo(u_id);

		return "redirect:/admin/reviewList.do";
	}
}