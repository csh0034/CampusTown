package com.seoil.campustown.user.service;

import java.util.List;

public interface UserService {

	List<UserVO> selectUserServiceList() throws Exception;

	int deleteUserServiceInfo(String u_id) throws Exception;

	UserVO selectUserServiceInfo(UserVO userVO) throws Exception;

}
