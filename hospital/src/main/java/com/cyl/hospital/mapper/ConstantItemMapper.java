package com.cyl.hospital.mapper;

import com.cyl.hospital.beans.ConstantItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ConstantItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ConstantItem record);

    int insertSelective(ConstantItem record);

    ConstantItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ConstantItem record);

    int updateByPrimaryKey(ConstantItem record);

    List<ConstantItem> getSexList();

    List<ConstantItem> getSettleCategoryList();

    List<ConstantItem> getConstantItemList();

    int deleteConstantById(int id);

    ConstantItem selectByPrimaryKey(int id);

    int updateConstant(ConstantItem constantItem);

    int addConstant(ConstantItem constantItem);
}