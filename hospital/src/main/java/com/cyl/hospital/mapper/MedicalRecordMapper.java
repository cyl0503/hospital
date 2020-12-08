package com.cyl.hospital.mapper;

import com.cyl.hospital.beans.medicalRecord;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MedicalRecordMapper {

    //根据病历号查询病例信息
    public medicalRecord getMedicalRecordByCaseNumber(String caseNumber);
    //医生填写病例初始诊断，暂存 状态1 第一次点击暂存时
    public int tempSaveAddRecord(medicalRecord medRecord);
    //医生填写病例初始诊断，暂存 状态1 不是第一次点击暂存
    public int tempSaveUpdateRecord(medicalRecord medicalRecord);
    //医生填写病例直接确诊，添加记录 状态2 证毕
    public int SaveAddRecord(medicalRecord medRecord);
    //医生填写病例直接确诊，修改记录 状态2 证毕
    public int SaveUpdateRecord(medicalRecord medicalRecord);
}
