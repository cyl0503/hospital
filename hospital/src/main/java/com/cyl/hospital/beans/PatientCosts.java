package com.cyl.hospital.beans;

import lombok.Data;

import java.util.Date;

@Data
public class PatientCosts {
    private Integer id;
    private String casenumber;
    private Integer itemid;
    private String itemname;
    private Integer itemtype;
    private Integer number;
    private Double price;
    private Double total; //单项总计
    private Integer doctorid;   //开立医生的id 指向userid
    private Date createtime;   //开立时间
    private Date paytime;   //收费时间
    private Integer registerid;  //收费操作员id 指向userid
    private Integer feetype;    //收费方式
    private String realName; //查询患者费用信息 患者名称
    private String doctorName; //查询患者费用信息 开立医生名称
}