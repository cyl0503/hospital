package com.cyl.hospital.mapper;

import com.cyl.hospital.beans.department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DepartmentMapper {

    public List<department> getAllDepartment(String deptName);

    public int delDeptById(int id);

    public department getDeptById(int id);

    public int updateDept(department dept);

    public int insertDept(department dept);
}
