package com.seoil.campustown.cmmn.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class CustomFileUtil {

	public static final String SAVE_FOLDER = "/files";
	public static final String FORM_FILE_NAME = "uploadfile";

	public static List<Map<String, Object>> getUploadFileList(int primaryKey, HttpServletRequest req) throws Exception {

		String serverPath = req.getSession().getServletContext().getRealPath(SAVE_FOLDER) + File.separator;

		@SuppressWarnings("unused")
		String fileSavePath = "";
		MultipartHttpServletRequest mulReq = (MultipartHttpServletRequest) req;

		String original_Name = null;
		String original_Extension = null;
		String stored_Name = null;
		
		List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
		Map<String, Object> fileMap = null;

		List<MultipartFile> mfList = mulReq.getFiles(FORM_FILE_NAME);
		
		//업로드된 파일이 없다면 리턴
		if(mfList.size() == 0) {
			return fileList;
		}
		
		Calendar cal = Calendar.getInstance();

		fileSavePath += serverPath + cal.get(Calendar.YEAR);
		fileSavePath += new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		fileSavePath += new DecimalFormat("00").format(cal.get(Calendar.DATE)) + File.separator;

		File file = new File(serverPath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		for (MultipartFile mf : mfList) {

			if (!mf.isEmpty()) {
				original_Name = mf.getOriginalFilename();
				original_Extension = mf.getOriginalFilename().substring(original_Name.lastIndexOf("."));
				stored_Name = UUID.randomUUID().toString().replaceAll("-", "") + original_Extension;

				file = new File(serverPath + stored_Name);
				mf.transferTo(file);

				fileMap = new HashMap<String, Object>();

				fileMap.put("s_num", primaryKey);
				fileMap.put("si_name", original_Name);
				fileMap.put("si_rename", stored_Name);
				fileList.add(fileMap);
			}
		}

		return fileList;
	}

	public static void deleteFile(String fileName, HttpServletRequest req) throws Exception {
		
		String serverPath = req.getSession().getServletContext().getRealPath(SAVE_FOLDER) + File.separator;
		
		File file = new File(serverPath,fileName);
		if (file.exists()) {
			file.delete();
		}
	}

}