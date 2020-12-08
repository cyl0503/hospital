package com.cyl.hospital.beans;

import lombok.Data;

@Data
public class registerLevel {
    private int id;
    private String levelName;
    private int registrationFee;
    private int levelQuota;//初始号额
    private int delFlag;

}
