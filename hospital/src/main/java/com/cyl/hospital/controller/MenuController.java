package com.cyl.hospital.controller;

import com.cyl.hospital.beans.menuInfo;
import com.cyl.hospital.beans.user;
import com.cyl.hospital.beans.userInfo;
import com.cyl.hospital.service.MenuService;
import com.cyl.hospital.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    MenuService menuService;
    @Autowired
    UserInfoService userInfoService;

    @RequestMapping("/getMenuLeft")
    public String getMenu(HttpSession session, Model model){
        userInfo user =(userInfo)session.getAttribute("userInfo");
        Map<Object,Object> map = new HashMap<Object, Object>();
        map.put("parentId",0);
        map.put("roleid", user.getRoleId());
        List<menuInfo> menuList= menuService.getMenuList(map);  //返回一级菜单
        for (menuInfo m:menuList) {
            Map<Object,Object> subMap = new HashMap<Object, Object>();
            subMap.put("parentId",m.getId());
            subMap.put("roleid",user.getRoleId());
            List<menuInfo> subMenuList= menuService.getMenuList(subMap); //二级菜单
            m.setSubList(subMenuList);
        }
        model.addAttribute("menuList",menuList);
        return "test";
    }
}
