package com.cyl.hospital.mapper;

import com.cyl.hospital.beans.registerInfo;
import com.cyl.hospital.beans.userInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface RegisterMapper {
    @Select("select ifnull(max(casenumber+0),0)+1 as caseNumber from registerinfo")
    String getCaseNumber();
    //select ifnull(max(casenumber+0),0)+1  from registerinfo
    
    int addRegister(registerInfo register);

    //查询挂号信息列表
    List<registerInfo> getRegisterList();

    //根据病历号查询信息
    registerInfo getRegisterByCaseNumber(String caseNumber);

    int updateRegisterStatus(String caseNumber);

    //查询已诊
    public List<registerInfo> getRegisterByDoctorHave(int doctorId);
    //查询未诊
    public List<registerInfo> getRegisterByDoctorNot(int doctorId);

    //医生接诊修改患者挂号信息状态
    public int updateRegisterStatusDocAccept(String caseNumber);
    //医生诊毕修改患者挂号信息状态
    public int updateRegisterStatusDocEnd(String caseNumber);
    //确诊功能中 根据病历号查询患者挂号基础信息何病例信息，患者状态为看诊结束
    public registerInfo getPatientMedicalRecordByCaseNumber(String caseNumber);
    //根据病历号查询患者基础数据和申请项目记录信息
    public List<registerInfo> getPatientCIApplyRecord(String caseNumber);
}
