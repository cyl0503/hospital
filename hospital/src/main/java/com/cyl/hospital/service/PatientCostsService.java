package com.cyl.hospital.service;

import com.cyl.hospital.beans.PatientCosts;
import com.cyl.hospital.mapper.PatientCostsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientCostsService {

    @Autowired
    PatientCostsMapper patientCostsMapper;

    //结算收费时添加患者费用明细信息
    public int addPatientCosts(PatientCosts patientCosts){
         return patientCostsMapper.addPatientCosts(patientCosts);
    }
    //查询患者所有费用明细
    public List<PatientCosts> getPatientCostsList(String caseNumber){
        return patientCostsMapper.getPatientCostsList(caseNumber);
    }
}
