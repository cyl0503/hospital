package com.cyl.hospital.beans;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ciApplyRecord {
    private int id;
    private String caseNumber;
    private int registerId; //挂号操作员ID
    private int itemId;
    private String itemName;
    private int number;
    private Timestamp createTime;
    private int doctorId;
    private int payStatus;//1 未付款 2 已付款
    private double total;
    private int recordType;//1 检查 2 检验
}
