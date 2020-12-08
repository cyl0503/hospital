package com.cyl.hospital.beans;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class registerInfo {
    private int id;
    private String caseNumber;//病历号
    private String realName;
    private String sex;
    private String idCard;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    private Integer age;
    private String address;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date visitDate; //看诊日期
    private int deptId;
    private int levelId;
    private int doctorId;
    private int isBook;
    private Date createTime;//挂号日期
    private Double cost;  //病历本+挂号级别
    private int registerId;
    private int status; //1 已挂号 2 医生接诊 3 看诊结束 4 已退号
    private userInfo user;//用户 挂号医生
    private department dept;//科室
    private registerLevel regLve;//挂号级别
    private medicalRecord mRecord;  //查询患者病例信息
    private ciApplyRecord applyRecord;  //申请记录表信息
    private double price; //检查检验项中的单价
    private int type;//检查，检验项类型
}
