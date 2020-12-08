package com.cyl.hospital.service;


import com.cyl.hospital.beans.department;
import com.cyl.hospital.mapper.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    public List<department> getAllDepartment(String deptName){
        return departmentMapper.getAllDepartment(deptName);
    }

    public int delDeptById(int id){
        return departmentMapper.delDeptById(id);
    }

    public department getDeptById(int id){
        return departmentMapper.getDeptById(id);
    }

    public int updateDept(department dept){
        return departmentMapper.updateDept(dept);
    }

    public int insertDept(department dept){
        return departmentMapper.insertDept(dept);
    }
}
