package com.cyl.hospital.controller;

import com.cyl.hospital.beans.*;
import com.cyl.hospital.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    UserInfoService service;
    @Autowired
    DepartmentService departmentService;
    @Autowired
    RegisterLevelService registerLevelService;
    @Autowired
    RoleService roleService;

    @RequestMapping(value = "/getAllUser")
    public String getAllUser(@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,
                             @RequestParam(value = "pageSize",defaultValue = "5")  Integer pageSize,
                             Model model,@ModelAttribute("realName")String realName) {
        PageHelper.startPage(pageNum,pageSize);
        List<userInfo> userList = service.getAllUserforForm(realName);
        PageInfo<userInfo> page = new PageInfo(userList);
        model.addAttribute("page",page);
        model.addAttribute("userList",userList);
        return "user/userlist";
    }


    @RequestMapping("/goToAddUser")
    public String to_add_user(Model model){
        List<roleInfo> roleList = roleService.getAllRole();
        model.addAttribute("roleList", roleList);
        List<department> deptList = departmentService.getAllDepartment("");
        model.addAttribute("deptList", deptList);
        List<registerLevel> regLevList = registerLevelService.getAllRegisterLevelIncludeWu();
        model.addAttribute("regLevList", regLevList);
        return "user/userAdd";
    }

    @RequestMapping("/addUser")
    public String insertUser(HttpServletRequest request, userInfo user) {
        service.insertUser(user);
        request.setAttribute("msg","添加成功");
        return "user/userAdd";
    }

    //跳转到更新界面
    @RequestMapping(value = "/update_user", method = RequestMethod.GET)
    public String goToUserEdit(int id, Model model) {
        userInfo uuser = service.getUserById(id);
        model.addAttribute("uuser", uuser);
        List<department> deptList = departmentService.getAllDepartment("");
        model.addAttribute("deptList", deptList);
        List<registerLevel> regLevList = registerLevelService.getAllRegisterLevelIncludeWu();
        model.addAttribute("regLevList", regLevList);
        return "user/userEdit";
    }

    //更新
    @RequestMapping(value = "/update_user", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("uuser") userInfo user, Model model) {
        service.updateUser(user);
        model.addAttribute("msg", "修改成功");
        return "user/userEdit";
    }

    //删除用户
    @RequestMapping("/delete_user")
    public String delUser(int id) {
        service.deleteUserById(id);
        return "forward:getAllUser";

    }
}
