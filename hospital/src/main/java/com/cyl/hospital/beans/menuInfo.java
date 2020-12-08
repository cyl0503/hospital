package com.cyl.hospital.beans;

import lombok.Data;

import java.util.List;

@Data
public class menuInfo {
    private int id;
    private String menuName;
    private String url;
    private int parentId;
    private String target;
    private String icon;
    private List<menuInfo> subList;//子菜单集合
}
