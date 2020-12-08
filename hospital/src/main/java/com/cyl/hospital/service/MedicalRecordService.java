package com.cyl.hospital.service;

import com.cyl.hospital.beans.medicalRecord;
import com.cyl.hospital.mapper.MedicalRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MedicalRecordService {

    @Autowired
    MedicalRecordMapper medicalRecordMapper;

    public medicalRecord getMedicalRecordByCaseNumber(String caseNumber){
        return medicalRecordMapper.getMedicalRecordByCaseNumber(caseNumber);
    }

    public int tempSaveAddRecord(medicalRecord medRecord){
        return medicalRecordMapper.tempSaveAddRecord(medRecord);
    }

    public int tempSaveUpdateRecord(medicalRecord medRecord){
        return medicalRecordMapper.tempSaveUpdateRecord(medRecord);
    }

    public int SaveAddRecord(medicalRecord medRecord){
        return medicalRecordMapper.tempSaveAddRecord(medRecord);
    }

    public int SaveUpdateRecord(medicalRecord medRecord){
        return medicalRecordMapper.tempSaveUpdateRecord(medRecord);
    }

}
