package com.cyl.hospital.mapper;


import com.cyl.hospital.beans.ConstantType;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ConstantTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ConstantType record);

    int insertSelective(ConstantType record);

    ConstantType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ConstantType record);

    int updateByPrimaryKey(ConstantType record);

    List<ConstantType> getConstantTypeList(String constantname);

    int delConstantTypeById(int id);

    ConstantType getConstantTypeById(int id);

    public int updateConstantType(ConstantType constantType);

    public int insertConstantType(ConstantType constantType);
}