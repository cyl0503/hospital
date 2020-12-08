package com.cyl.hospital.service;

import com.cyl.hospital.beans.registerInfo;
import com.cyl.hospital.mapper.RegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RegisterService {

    @Autowired
    RegisterMapper registerMapper;

    public String getCaseNumber()
    {
        return registerMapper.getCaseNumber();
    }
    public int addRegister(registerInfo register){
        return registerMapper.addRegister(register);
    }

    public List<registerInfo> getRegisterList(){
        return registerMapper.getRegisterList();
    }

    //根据病历号查询信息
    public registerInfo getRegisterByCaseNumber(String caseNumber){
        return registerMapper.getRegisterByCaseNumber(caseNumber);
    }

     public int updateRegisterStatus(String caseNumber){
        return  registerMapper.updateRegisterStatus(caseNumber);
     }

    //查询已诊
    public List<registerInfo> getRegisterByDoctorHave(int doctorId){
        return registerMapper.getRegisterByDoctorHave(doctorId);
    }
    //查询未诊
    public List<registerInfo> getRegisterByDoctorNot(int doctorId){
        return registerMapper.getRegisterByDoctorNot(doctorId);
    }

    //医生接诊修改患者挂号信息状态
    public int updateRegisterStatusDocAccept(String caseNumber){
        return registerMapper.updateRegisterStatusDocAccept(caseNumber);
    }
    //医生诊毕修改患者挂号信息状态
    public int updateRegisterStatusDocEnd(String caseNumber){
        return registerMapper.updateRegisterStatusDocEnd(caseNumber);
    }
    //确诊功能中 根据病历号查询患者挂号基础信息何病例信息，患者状态为看诊结束
    public registerInfo getPatientMedicalRecordByCaseNumber(String caseNumber){
        return registerMapper.getPatientMedicalRecordByCaseNumber(caseNumber);
    }
    //根据病历号查询患者基础数据和申请项目记录信息
    public List<registerInfo> getPatientCIApplyRecord(String caseNumber){
        return registerMapper.getPatientCIApplyRecord(caseNumber);
    }
}
