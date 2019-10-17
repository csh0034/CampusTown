package com.seoil.campustown.cmmn.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.seoil.campustown.user.service.UserVO;


public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("user");
		
		if (userVO == null) {
			
			PrintWriter out = response.getWriter();
			
			response.setContentType("text/html;charset=UTF-8");
			
			out.println("<script>");
			out.println("	alert('관리자 로그인후 이용 가능합니다.')");
			out.println("	location.href='/'");
			out.println("</script>");
			
			return false;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

}
