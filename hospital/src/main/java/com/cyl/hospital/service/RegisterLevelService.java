package com.cyl.hospital.service;

import com.cyl.hospital.beans.department;
import com.cyl.hospital.beans.registerLevel;
import com.cyl.hospital.mapper.RegisterLevelMapper;
import com.cyl.hospital.mapper.RegisterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegisterLevelService {

    @Autowired
    RegisterLevelMapper registerLevelMapper;

    public List<registerLevel> getAllRegisterLevel(){
        return registerLevelMapper.getAllRegisterLevel();
    }

    public List<registerLevel> getRegisterLevelList(String levelName){
        return registerLevelMapper.getRegisterLevelList(levelName);
    }

    public List<registerLevel> getAllRegisterLevelIncludeWu(){
        return registerLevelMapper.getAllRegisterLevelIncludeWu();
    }

    public int delRegLevelById(int id){
        return registerLevelMapper.delRegLevelById(id);
    }

    public registerLevel getRegLevelById(int id){
        return registerLevelMapper.getRegLevelById(id);
    }

    public int updateRegLevel(registerLevel reglevel){
        return registerLevelMapper.updateRegLevel(reglevel);
    }

    public int insertRegLevel(registerLevel reglevel){
        return registerLevelMapper.insertRegLevel(reglevel);
    }

}
