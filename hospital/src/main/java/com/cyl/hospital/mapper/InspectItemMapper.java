package com.cyl.hospital.mapper;

import com.cyl.hospital.beans.checkInspectItemInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InspectItemMapper {

    //查询所有检查项目
    public List<checkInspectItemInfo> getCheckItemList();
    //查询所有检验项目
    public List<checkInspectItemInfo> getInspectItemList();
}
