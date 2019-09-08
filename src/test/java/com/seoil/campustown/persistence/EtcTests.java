package com.seoil.campustown.persistence;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.seoil.campustown.store.service.impl.StoreMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/com/spring/context-datasource.xml", "/com/spring/context-mapper.xml",
		"/com/spring/context-common.xml" })
public class EtcTests {
	
	@Resource
	StoreMapper storeMapper;

	@Test
	public void testMethod() throws Exception {
		

		List<Map<String, Object>> uploadList = new ArrayList<>();
		
		File files = new File("c://pic");
		File fileList[] = files.listFiles();

		for (File tempFile : fileList) {
			if (tempFile.isFile()) {
				String tempFileName = tempFile.getName();
				
				Map<String, Object> map = new HashMap<>();
				map.put("s_num",Integer.parseInt(tempFileName.split("_")[0]));
				map.put("si_name",tempFileName);
				map.put("si_rename",tempFileName);
				
				System.out.println(tempFileName.split("_")[0]);
				
				uploadList.add(map);
			}
		}
		
		storeMapper.insertStoreServiceFiles(uploadList);
	}
}
