package com.cyl.hospital.service;

import com.cyl.hospital.beans.roleInfo;
import com.cyl.hospital.beans.roleMenu;
import com.cyl.hospital.mapper.RoleInfoMapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RoleService {

    @Autowired
    RoleInfoMapper roleInfoMapper;

    public List<roleInfo> getAllRole(){
        return roleInfoMapper.getAllRole();
    }

    public List<roleInfo> getRoleList(String roleName){
        return roleInfoMapper.getRoleList(roleName);
    }

    public int addRole(roleInfo role){
        return roleInfoMapper.addRole(role);
    }

    public int delRoleById(int id){
        return roleInfoMapper.delRoleById(id);
    }

    public roleInfo getRoleById(int id){
        return roleInfoMapper.getRoleById(id);
    }

    public int updateRole(roleInfo role){
        return roleInfoMapper.updateRole(role);
    }

    public List<roleMenu> getRoleMenuId(int roleId) {
        return roleInfoMapper.getRoleMenuId(roleId);
    }

    public int delRoleMenu(int roleId) {
        return roleInfoMapper.delRoleMenu(roleId);
    }

    public int addRoleMenu(Map<Object, Object> map) {
        return roleInfoMapper.addRoleMenu(map);
    }
}
