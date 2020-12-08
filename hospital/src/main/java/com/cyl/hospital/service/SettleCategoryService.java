package com.cyl.hospital.service;

import com.cyl.hospital.beans.SettleCategory;
import com.cyl.hospital.mapper.SettleCategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SettleCategoryService {

    @Autowired
    SettleCategoryMapper settleCategoryMapper;
    //查询所有类型
    public List<SettleCategory> getSettleCategoryList(){
        return settleCategoryMapper.getSettleCategoryList();
    }

    public List<SettleCategory> getAllSettleCategory(String settleName){
        return settleCategoryMapper.getAllSettleCategory(settleName);
    }

    public int delSettleCategoryById(int id){
        return settleCategoryMapper.delSettleCategoryById(id);
    }

    public SettleCategory getSettleCategoryById(int id){
        return settleCategoryMapper.getSettleCategoryById(id);
    }

    public int updateSettleCategory(SettleCategory settleCategory){
        return settleCategoryMapper.updateSettleCategory(settleCategory);
    }

    public int insertSettleCategory(SettleCategory settleCategory){
        return settleCategoryMapper.insertSettleCategory(settleCategory);
    }
}
