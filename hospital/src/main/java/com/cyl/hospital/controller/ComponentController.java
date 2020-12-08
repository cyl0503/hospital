package com.cyl.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 这个就相当于获取一个个组件
 */
@Controller
public class ComponentController {

    @RequestMapping("/home")
    public String toHome(){
        return "home";
    }

    @RequestMapping("/table")
    public String toTable(){
        return "table";
    }

    @RequestMapping("/blank")
    public String toBlank(){
        return "blank";
    }
    @RequestMapping("/err")
    public String toError(){
        return "404";
    }
    @RequestMapping("/map-google")
    public String toMapGoogle(){
        return "map-google";
    }
    @RequestMapping("/fontawesome")
    public String toFontawesome(){
        return "fontawesome";
    }
    @RequestMapping("/profile")
    public String toProfile(){
        return "profile";
    }
}
