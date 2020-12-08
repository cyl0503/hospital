package com.cyl.hospital.beans;

import lombok.Data;

@Data
public class userInfo {
    private int userId;
    private String userName;
    private String password;
    private String realName;
    private int roleId;
    private int deptId;
    private int levelId;
    private int delFlag;
    private String roleName;
    private String levelName;
    private String deptName;
}