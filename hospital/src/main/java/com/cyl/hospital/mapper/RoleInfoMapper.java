package com.cyl.hospital.mapper;


import com.cyl.hospital.beans.roleInfo;
import com.cyl.hospital.beans.roleMenu;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface RoleInfoMapper {

    List<roleInfo> getAllRole();

    int addRole(roleInfo role);

    List<roleInfo> getRoleList(String roleName);

    int delRoleById(int id);

    public roleInfo getRoleById(int id);

    public int updateRole(roleInfo role);

    @Select("select * from rolemenu where roleId = #{roleId}")
    List<roleMenu> getRoleMenuId(int roleId);

    @Delete("delete from rolemenu where roleId = #{roleId}")
    int delRoleMenu(int roleId);

    @Insert("insert into roleMenu(roleId,menuId) values(#{roleId},#{menuId})")
    int addRoleMenu(Map<Object, Object> map);
}
