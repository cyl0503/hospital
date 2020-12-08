package com.cyl.hospital.service;

import com.cyl.hospital.beans.menuInfo;
import com.cyl.hospital.mapper.MenuInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MenuService {
    @Autowired
    MenuInfoMapper menuMapper;

    public List<menuInfo> getMenuList(Map<Object,Object> map)  {
        return menuMapper.getMenuList(map);
    }

    public List<menuInfo> getMenuListForRole(int parentId) {
        return menuMapper.getMenuListForRole(parentId);
    }
}
