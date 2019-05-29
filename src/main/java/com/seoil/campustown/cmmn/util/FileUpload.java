package com.seoil.campustown.cmmn.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;

public class FileUpload {
	@SuppressWarnings("unused")
	private static String calcPath() {
		
		Calendar cal = Calendar.getInstance();

		String path = File.separator + cal.get(Calendar.YEAR);
		path += new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		path += new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		return path;
	}
	
	//파일의 확장자 리턴
	@SuppressWarnings("unused")
	private String getFileExcension(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}
}
