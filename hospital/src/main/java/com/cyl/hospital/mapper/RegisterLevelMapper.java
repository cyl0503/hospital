package com.cyl.hospital.mapper;

import com.cyl.hospital.beans.department;
import com.cyl.hospital.beans.registerLevel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface RegisterLevelMapper {
    @Select("select * from registerLevel where id!=3 and delFlag=1")
    public List<registerLevel> getAllRegisterLevel();

    @Select("select * from registerLevel where delFlag=1")
    public List<registerLevel> getAllRegisterLevelIncludeWu();

    public List<registerLevel> getRegisterLevelList(String levelName);

    public int delRegLevelById(int id);

    public registerLevel getRegLevelById(int id);

    public int updateRegLevel(registerLevel reglevel);

    public int insertRegLevel(registerLevel reglevel);
}
