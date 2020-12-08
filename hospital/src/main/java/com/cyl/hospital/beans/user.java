package com.cyl.hospital.beans;

import lombok.Data;

@Data
public class user {
    private int userId;
    private String userName;
    private String password;
    private String realName;
    private String roleName;
    private String deptName;
    private String levelName;
}
