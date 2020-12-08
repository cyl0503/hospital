package com.cyl.hospital.beans;

import lombok.Data;

@Data
public class medicalRecord {
    private int id;
    private String caseNumber;
    private int registerId;
    private String description;
    private String medicalHistory;
    private String familyHistory;
    private String primaryDiagnosis;
    private String checkResult;
    private String finalDiagnosis;
    private int status;//已提交 2 诊毕
}
