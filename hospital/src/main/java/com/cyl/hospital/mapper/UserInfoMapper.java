package com.cyl.hospital.mapper;


import com.cyl.hospital.beans.department;
import com.cyl.hospital.beans.roleInfo;
import com.cyl.hospital.beans.user;
import com.cyl.hospital.beans.userInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserInfoMapper {

    List<userInfo> getAllUser();

    List<userInfo> getAllUserforForm(String realName);

    List<userInfo> getDoctorByDeptAndRegisterLevel(Map<Object,Object> map);

    userInfo getUserById(int userId);

    int insertUser(userInfo user);

    int deleteUserById(int userId);

    int updateUser(userInfo user);

    userInfo Login(@Param("userName") String userName,@Param("password") String password);

    int getlevelQuota(int doctorId);

    int getUsedlevelQuota(int doctorId);

    List<userInfo> getUserList(String userName);

    int updateUserRole(userInfo user);
}
