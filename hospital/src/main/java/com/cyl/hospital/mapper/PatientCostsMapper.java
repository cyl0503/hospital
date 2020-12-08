package com.cyl.hospital.mapper;

import com.cyl.hospital.beans.PatientCosts;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PatientCostsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PatientCosts record);

    int insertSelective(PatientCosts record);

    PatientCosts selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PatientCosts record);

    int updateByPrimaryKey(PatientCosts record);

    int addPatientCosts(PatientCosts patientCosts);
    //查询患者所有费用明细
    List<PatientCosts> getPatientCostsList(String caseNumber);
}