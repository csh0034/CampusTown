package com.seoil.campustown.notice.web;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seoil.campustown.cmmn.util.Criteria;
import com.seoil.campustown.cmmn.util.CustomFileUtil;
import com.seoil.campustown.cmmn.util.PageMaker;
import com.seoil.campustown.notice.service.NoticeService;
import com.seoil.campustown.notice.service.NoticeVO;

@Controller
public class NoticeController {

	@Resource
	private NoticeService noticeService;

	@GetMapping("/notice/list.do")
	public String noticeList(ModelMap model, Criteria criteria) throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(noticeService.selectNoticeServiceListCount(criteria));

		List<NoticeVO> noticeList = noticeService.selectNoticeServiceList(criteria);

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("noticeList", noticeList);

		return "user/notice/noticeList.tiles";
	}
	
	@GetMapping(value = "/notice/detail.do")
	public String noticeDetail(@RequestParam(defaultValue = "1", required = false) int num, ModelMap model)
			throws Exception {
		
		noticeService.updateNoticeServiceHitInfo(num);

		NoticeVO noticeInfo = noticeService.selectNoticeServiceInfo(num);

		model.addAttribute("noticeInfo", noticeInfo);

		return "user/notice/noticeDetail.tiles";
	}

	@GetMapping("/admin/noticeList.do")
	public String noticeList(ModelMap model) throws Exception {

		List<NoticeVO> noticeList = noticeService.selectNoticeServiceAllList();

		model.addAttribute("noticeList", noticeList);

		return "admin/notice/noticeList.tilesAdmin";
	}

	@GetMapping("/admin/noticeAdd.do")
	public String noticeAdd(ModelMap model) throws Exception {
		return "admin/notice/noticeDetail.tilesAdmin";
	}

	@PostMapping("/admin/noticeAdd.do")
	public String storeAdd(@ModelAttribute NoticeVO noticeVO, HttpServletRequest req) throws Exception {

		List<Map<String, Object>> uploadList = CustomFileUtil.getUploadFileList(0, req,"notice");

		if (uploadList.size() > 0) {
			noticeVO.setN_attach((String) uploadList.get(0).get("si_rename"));
		}

		noticeService.insertNoticeServiceInfo(noticeVO);

		return "redirect:/admin/noticeList.do";
	}

	@GetMapping("/admin/noticeModify.do")
	public String noticeModify(@RequestParam(defaultValue = "1", required = false) int num, ModelMap model)
			throws Exception {

		NoticeVO noticeInfo = noticeService.selectNoticeServiceInfo(num);

		model.addAttribute("noticeInfo", noticeInfo);

		return "admin/notice/noticeModify.tilesAdmin";
	}

	@PostMapping("/admin/noticeModify.do")
	public String noticeModify(@ModelAttribute NoticeVO noticeVO, HttpServletRequest req) throws Exception {

		List<Map<String, Object>> uploadList = CustomFileUtil.getUploadFileList(0, req,"notice");

		if (uploadList.size() > 0) {
			noticeVO.setN_attach((String) uploadList.get(0).get("si_rename"));
		}

		noticeService.updateNoticeServiceInfo(noticeVO);

		return "redirect:/admin/noticeList.do";
	}

	@GetMapping(value = "/admin/noticeFileDelete.do")
	@ResponseBody
	public String noticeFileDelete(HttpServletRequest req) throws Exception {

		noticeService.updateNoticeServiceFileInfo(req);

		return "good";
	}

	@GetMapping("/admin/noticeDelete.do")
	public String storeDelete(@RequestParam(defaultValue = "1", required = false) int num, HttpServletRequest req)
			throws Exception {

		noticeService.deleteNoticeServiceInfo(num, req);

		return "redirect:/admin/noticeList.do";
	}

	@GetMapping(value = "admin/noticeDownload.do", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<org.springframework.core.io.Resource> noticeDownload(@RequestParam String file,
			HttpServletRequest req) throws Exception {

		String serverPath = req.getSession().getServletContext().getRealPath("/files") + File.separator;

		org.springframework.core.io.Resource resource = new FileSystemResource(serverPath + file);

		HttpHeaders headers = new HttpHeaders();

		headers.add("Content-Disposition", "attachment; filename=" + new String(file.getBytes("UTF-8"), "ISO-8859-1"));

		return new ResponseEntity<org.springframework.core.io.Resource>(resource, headers, HttpStatus.OK);
	}

}
