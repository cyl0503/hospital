package com.cyl.hospital.mapper;

import com.cyl.hospital.beans.SettleCategory;
import com.cyl.hospital.beans.department;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SettleCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SettleCategory record);

    int insertSelective(SettleCategory record);

    SettleCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SettleCategory record);

    int updateByPrimaryKey(SettleCategory record);
    //查询所有类型
    List<SettleCategory> getSettleCategoryList();

    public List<SettleCategory> getAllSettleCategory(String settleName);

    public int delSettleCategoryById(int id);

    public SettleCategory getSettleCategoryById(int id);

    public int updateSettleCategory(SettleCategory settleCategory);

    public int insertSettleCategory(SettleCategory settleCategory);

}