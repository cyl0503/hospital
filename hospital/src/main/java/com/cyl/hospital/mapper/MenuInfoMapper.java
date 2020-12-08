package com.cyl.hospital.mapper;

import com.cyl.hospital.beans.menuInfo;
import com.cyl.hospital.beans.userInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface MenuInfoMapper {
    @Select("select * from menuinfo where parentId=#{parentId} and id in (select menuId from rolemenu where roleid=#{roleid})")
    List<menuInfo> getMenuList(Map map);

    @Select("select * from menuinfo where parentId=#{parentId}")
    List<menuInfo> getMenuListForRole(int parentId);
}
