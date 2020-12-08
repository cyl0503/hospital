package com.cyl.hospital.service;

import com.cyl.hospital.beans.ConstantItem;
import com.cyl.hospital.beans.ConstantType;
import com.cyl.hospital.mapper.ConstantItemMapper;
import com.cyl.hospital.mapper.ConstantTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConstantService {

    @Autowired
    ConstantItemMapper constantItemMapper;
    @Autowired
    ConstantTypeMapper constantTypeMapper;

    ////查询性别列表
    public List<ConstantItem> getSexList(){
        return constantItemMapper.getSexList();
    }

    //查询收费方式
    public List<ConstantItem> getSettleCategoryList(){
        return constantItemMapper.getSettleCategoryList();
    }

    public List<ConstantItem> getConstantItemList(){
        return constantItemMapper.getConstantItemList();
    }

    public int deleteConstantById(int id){
        return constantItemMapper.deleteConstantById(id);
    }

    public ConstantItem selectByPrimaryKey(int id){
        return constantItemMapper.selectByPrimaryKey(id);
    }

    public int updateConstant(ConstantItem constantItem){
        return constantItemMapper.updateConstant(constantItem);
    }

    public int addConstant(ConstantItem constantItem){
       return constantItemMapper.addConstant(constantItem);
    }

    //查找常数项类型列表
    public List<ConstantType> getConstantTypeList(String constantname){
        return constantTypeMapper.getConstantTypeList(constantname);
    }

    public int delConstantType(int id){
        return constantTypeMapper.delConstantTypeById(id);
    }

    public ConstantType getConstantTypeById(int id){
        return constantTypeMapper.getConstantTypeById(id);
    }

    public int updateConstantType(ConstantType constantType){
        return constantTypeMapper.updateConstantType(constantType);
    }

    public int insertConstantType(ConstantType constantType){
        return constantTypeMapper.insertConstantType(constantType);
    }



}
