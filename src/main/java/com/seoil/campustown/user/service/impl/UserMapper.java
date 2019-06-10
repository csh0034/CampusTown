package com.seoil.campustown.user.service.impl;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.seoil.campustown.user.service.UserVO;

@Mapper
public interface UserMapper {

	List<UserVO> selectUserServiceList() throws Exception;

	int deleteUserServiceInfo(String u_id) throws Exception;

	UserVO selectUserServiceInfo(UserVO userVO) throws Exception;

	int insertUserServiceInfo(UserVO userVO) throws Exception;

	int updateUserServiceInfo(UserVO userVO) throws Exception;

}
