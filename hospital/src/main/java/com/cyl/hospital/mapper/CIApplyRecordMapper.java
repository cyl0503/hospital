package com.cyl.hospital.mapper;

import com.cyl.hospital.beans.ciApplyRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface CIApplyRecordMapper {
     //添加项目申请记录
    public int addApplyRecord(ciApplyRecord cApplyRecord);

    public int updatePatientCIApplrRecordStatus(Map<Object,Object> map);
}
