package com.seoil.campustown.persistence;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;

import org.junit.Test;
import lombok.extern.log4j.Log4j;

@Log4j
public class EtcTests {

	@Test
	public void testMethod() {

		Calendar cal = Calendar.getInstance();

		String path = File.separator + cal.get(Calendar.YEAR);
		path += new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		path += new DecimalFormat("00").format(cal.get(Calendar.DATE));

		log.info(path);
	}
}
