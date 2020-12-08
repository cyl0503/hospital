package com.cyl.hospital.service;

import com.cyl.hospital.beans.checkInspectItemInfo;
import com.cyl.hospital.beans.ciApplyRecord;
import com.cyl.hospital.mapper.CIApplyRecordMapper;
import com.cyl.hospital.mapper.InspectItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CIItemAndApplyService {

    @Autowired
    InspectItemMapper inspectItemMapper;
    @Autowired
    CIApplyRecordMapper ciApplyRecordMapper;

    //查询所有检查项目
    public List<checkInspectItemInfo> getCheckItemList(){
        return inspectItemMapper.getCheckItemList();
    }
    //查询所有检验项目
    public List<checkInspectItemInfo> getInspectItemList(){
        return inspectItemMapper.getInspectItemList();
    }

    public int addApplyRecord(ciApplyRecord cApplyRecord){
        return ciApplyRecordMapper.addApplyRecord(cApplyRecord);
    }

    public int updatePatientCIApplrRecordStatus(Map<Object,Object> map){
        return ciApplyRecordMapper.updatePatientCIApplrRecordStatus(map);
    }

}
