package com.cyl.hospital;

import com.cyl.hospital.beans.userInfo;
import com.cyl.hospital.mapper.UserInfoMapper;
import com.cyl.hospital.service.UserInfoService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
class HospitalApplicationTests {

    @Autowired
    UserInfoService service;
    @Test
    void contextLoads() {
        for (userInfo u: service.getAllUser()) {
            System.out.println(u);
        }
    }

}
