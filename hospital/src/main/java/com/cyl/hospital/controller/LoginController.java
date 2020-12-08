package com.cyl.hospital.controller;


import com.cyl.hospital.beans.userInfo;
import com.cyl.hospital.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    UserInfoService service;

    @RequestMapping("/login")
    public String toLogin(ModelMap map){
        return "login";
    }

    @RequestMapping(value="/login",method = RequestMethod.POST)
    public String Login(String userName, String password, HttpSession session, Model model){
        Map<Object,Object> map = new HashMap<Object,Object>();
        userInfo userInfo = service.Login(userName,password);
         if(userInfo!=null)  {
             session.setAttribute("userInfo",userInfo);
             session.setAttribute("realName",userInfo.getRealName());
             return "index";
         }else {
             model.addAttribute("msg","登陆失败，账号或密码错误！！");
             return "login";
         }
    }

    //注销、退出
    @RequestMapping("/logout")
    public void logout(HttpSession session, HttpServletResponse response) throws IOException {
        session.invalidate(); //清除session
        response.sendRedirect("/login");
    }

    //注销、退出
    /*@RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate(); //清除session
        return "login";
    }*/
}
