package com.cyl.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {
    /**
     * 功能：跳转主页
     * @return
     */
    @RequestMapping("")
    public String index(){
        return "index";
    }
}
