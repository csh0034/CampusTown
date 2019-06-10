package com.seoil.campustown.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seoil.campustown.user.service.UserService;
import com.seoil.campustown.user.service.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper userMapper;
	
	@Override
	public List<UserVO> selectUserServiceList() throws Exception {
		return userMapper.selectUserServiceList();
	}

	@Override
	public int deleteUserServiceInfo(String u_id) throws Exception {
		return userMapper.deleteUserServiceInfo(u_id);
	}

	@Override
	public UserVO selectUserServiceInfo(UserVO userVO) throws Exception {
		return userMapper.selectUserServiceInfo(userVO);
	}

	@Override
	public int insertUserServiceInfo(UserVO userVO) throws Exception {
		return userMapper.insertUserServiceInfo(userVO);
	}

	@Override
	public int updateUserServiceInfo(UserVO userVO) throws Exception {
		return userMapper.updateUserServiceInfo(userVO);
	}
	
}
