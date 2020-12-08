package com.cyl.hospital.beans;

import lombok.Data;

@Data
public class checkInspectItemInfo {
    private int id;
    private String ItemName;
    private double price;
    private int type;   //1 检查项目 2 检验项目
}
