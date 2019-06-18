package com.seoil.campustown.store.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.seoil.campustown.cmmn.util.Criteria;
import com.seoil.campustown.cmmn.util.CustomFileUtil;
import com.seoil.campustown.store.service.StoreService;
import com.seoil.campustown.store.service.StoreVO;

@Service
public class StoreServiceImpl implements StoreService {

	@Resource
	private StoreMapper storeMapper;

	@Override
	public StoreVO selectStoreServiceInfo(int s_num) throws Exception {
		return storeMapper.selectStoreServiceInfo(s_num);
	}

	@Override
	public int insertStoreServiceInfo(StoreVO storeVO) throws Exception {
		return storeMapper.insertStoreServiceInfo(storeVO);
	}

	@Override
	public List<StoreVO> selectStoreServiceAllList() throws Exception {
		return storeMapper.selectStoreServiceAllList();
	}

	@Override
	public List<StoreVO> selectStoreServiceList(Criteria criteria) throws Exception {
		return storeMapper.selectStoreServiceList(criteria);
	}

	@Override
	public int selectStoreServiceListCount(Criteria criteria) throws Exception {
		return storeMapper.selectStoreServiceListCount(criteria);
	}

	@Override
	public List<Map<String, Object>> selectStoreServiceCategoryList() throws Exception {
		return storeMapper.selectStoreServiceCategoryList();
	}

	@Override
	public boolean updateStoreServiceInfo(StoreVO storeVO) throws Exception {

		int saveReturn = storeMapper.updateStoreServiceInfo(storeVO);
		boolean success = false;

		if (saveReturn == 1) {
			success = true;
		}

		return success;
	}

	@Override
	public boolean deleteStoreServiceInfo(int s_num) throws Exception {

		int saveReturn = storeMapper.deleteStoreServiceInfo(s_num);
		boolean success = false;

		if (saveReturn == 1) {
			success = true;
		}

		return success;
	}

	@Override
	public int insertStoreServiceFiles(int s_num, HttpServletRequest req) throws Exception {

		List<Map<String, Object>> uploadList = CustomFileUtil.getUploadFileList(s_num, req);

		if (uploadList.size() == 0) {
			return 0;
		}

		return storeMapper.insertStoreServiceFiles(uploadList);
	}

	@Override
	public List<Map<String, Object>> selectStoreServiceFileList(int s_num) throws Exception {
		return storeMapper.selectStoreServiceFileList(s_num);
	}

	@Override
	public int deleteStoreServiceFileInfo(HttpServletRequest req) throws Exception {

		int si_num = Integer.parseInt(req.getParameter("si_num"));
		String si_rename = req.getParameter("si_rename");

		int count = storeMapper.deleteStoreServiceFileInfo(si_num);

		if (count > 0) {
			CustomFileUtil.deleteFile(si_rename, req);
		}

		return count;
	}

	@Override
	public int deleteStoreServiceFileList(int s_num, HttpServletRequest req) throws Exception {
		
		List<Map<String, Object>> storeFileList = storeMapper.selectStoreServiceFileList(s_num);
		
		int count = storeMapper.deleteStoreServiceFileList(s_num);

		if (count > 0) {

			for (Map<String, Object> map : storeFileList) {
				CustomFileUtil.deleteFile((String) map.get("si_rename"), req);
			}
		}

		return count;
	}

	@Override
	public List<StoreVO> selectStoreServiceBestList() throws Exception {
		return storeMapper.selectStoreServiceBestList();
	}
}
