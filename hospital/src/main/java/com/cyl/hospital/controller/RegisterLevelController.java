package com.cyl.hospital.controller;

import com.cyl.hospital.beans.department;
import com.cyl.hospital.beans.registerLevel;
import com.cyl.hospital.service.RegisterLevelService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/registerLevel")
public class RegisterLevelController {
    @Autowired
    RegisterLevelService registerLevelService;

    @RequestMapping("getRegisterLevelList")
    public String getRegisterLevelList(@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,
                                       @RequestParam(value = "pageSize",defaultValue = "5")  Integer pageSize,
                                       Model model, @ModelAttribute("levelName")String levelName){
        PageHelper.startPage(pageNum,pageSize);
        List<registerLevel> registerLevelList = registerLevelService.getRegisterLevelList(levelName);
        PageInfo<registerLevel> page = new PageInfo(registerLevelList);
        model.addAttribute("page",page);
        model.addAttribute("registerLevelList",registerLevelList);
        return "registerLevel/regLevelList";
    }

    //删除挂号级别
    @RequestMapping("/delRegLevel")
    public String delDept(int id) {
        registerLevelService.delRegLevelById(id);
        return "forward:getRegisterLevelList";

    }

    //跳转到更新界面
    @RequestMapping(value = "/updateRegLevel", method = RequestMethod.GET)
    public String goToDeptEdit(int id, Model model) {
        registerLevel reggLevel = registerLevelService.getRegLevelById(id);
        model.addAttribute("reggLevel", reggLevel);
        return "registerLevel/regLevelEdit";
    }

    //更新
    @RequestMapping(value = "/updateReglevel", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("reggLevel") registerLevel regLevel, Model model) {
        registerLevelService.updateRegLevel(regLevel);
        model.addAttribute("msg", "修改成功");
        return "registerLevel/regLevelEdit";
    }

    @RequestMapping("/goToAddRegLevel")
    public String goToAddRegLevel(Model model){
        return "registerLevel/regLevelAdd";
    }

    @RequestMapping("/addReglevel")
    public String insertUser(HttpServletRequest request, registerLevel regLevel) {
        registerLevelService.insertRegLevel(regLevel);
        request.setAttribute("msg","添加成功");
        return "registerLevel/regLevelAdd";
    }

}
