package com.cyl.hospital.service;

import com.cyl.hospital.beans.roleInfo;
import com.cyl.hospital.beans.user;
import com.cyl.hospital.beans.userInfo;
import com.cyl.hospital.mapper.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserInfoService {

    @Autowired
    UserInfoMapper mapper;

    public List<userInfo> getAllUser()
    {
        return mapper.getAllUser();
    }
    public List<userInfo> getAllUserforForm(String realName) {
        return mapper.getAllUserforForm(realName);
    }

    public List<userInfo> getDoctorByDeptAndRegisterLevel(Map<Object,Object> map){
        return mapper.getDoctorByDeptAndRegisterLevel(map);
    }

    public int insertUser(userInfo user) {
        int result = mapper.insertUser(user);
        return result;
    }

    public int updateUser(userInfo user) {
        return mapper.updateUser(user);
    }

    public int deleteUserById(Integer id) {
        return mapper.deleteUserById(id);
    }
    
    public userInfo getUserById(Integer id) {
        return mapper.getUserById(id);
    }

    public userInfo Login(String userName,String password) {
        return mapper.Login(userName, password);
    }

    public int getlevelQuota(int doctorId){
        return mapper.getlevelQuota(doctorId);
    }
    public int getUsedlevelQuota(int doctorId){
        return mapper.getUsedlevelQuota(doctorId);
    }

    public List<userInfo> getUserList(String userName) {
        return mapper.getUserList(userName);
    }

    public int updateUserRole(userInfo user) {
        return mapper.updateUserRole(user);
    }
}
