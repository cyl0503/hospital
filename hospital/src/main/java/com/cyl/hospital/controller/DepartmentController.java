package com.cyl.hospital.controller;

import com.cyl.hospital.beans.department;
import com.cyl.hospital.service.DepartmentService;
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
@RequestMapping("/dept")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/getDeptList")
    public String getDeptList(@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,
                              @RequestParam(value = "pageSize",defaultValue = "5")  Integer pageSize,
                              Model model, @ModelAttribute("deptName")String deptName){
        PageHelper.startPage(pageNum,pageSize);
        List<department> deptList = departmentService.getAllDepartment(deptName);
        PageInfo<department> page = new PageInfo(deptList);
        model.addAttribute("page",page);
        model.addAttribute("deptList",deptList);
        return "department/deptList";
    }

    //删除科室
    @RequestMapping("/delDept")
    public String delDept(int id) {
        departmentService.delDeptById(id);
        return "forward:getDeptList";

    }

    //跳转到更新界面
    @RequestMapping(value = "/updateDept", method = RequestMethod.GET)
    public String goToDeptEdit(int id, Model model) {
        department deptt = departmentService.getDeptById(id);
        model.addAttribute("deptt", deptt);
        return "department/deptEdit";
    }

    //更新
    @RequestMapping(value = "/updateDept", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute("deptt") department dept, Model model) {
        departmentService.updateDept(dept);
        System.out.println(dept);
        model.addAttribute("msg", "修改成功");
        return "department/deptEdit";
    }

    @RequestMapping("/goToAddDept")
    public String to_add_user(Model model){
        return "department/deptAdd";
    }

    @RequestMapping("/addDept")
    public String insertUser(HttpServletRequest request, department dept) {
        departmentService.insertDept(dept);
        request.setAttribute("msg","添加成功");
        return "department/deptAdd";
    }
}
