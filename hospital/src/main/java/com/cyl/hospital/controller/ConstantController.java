package com.cyl.hospital.controller;


import com.cyl.hospital.beans.ConstantItem;
import com.cyl.hospital.beans.ConstantType;
import com.cyl.hospital.beans.department;
import com.cyl.hospital.beans.userInfo;
import com.cyl.hospital.service.ConstantService;
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
@RequestMapping("/constant")
public class ConstantController {
      @Autowired
      ConstantService constantService;

      @RequestMapping("/getSexList")
      public String getSexList(Model model){
          List<ConstantItem> sexList = constantService.getSexList();
          model.addAttribute("sexList",sexList);
          return "medical/medicalRecordConfirmed";
      }
      //查
      @RequestMapping("/gotoConstantItem")
      public String GoToConstantItem(Model model){
          List<ConstantItem> constList = constantService.getConstantItemList();
          model.addAttribute("constList",constList);
          return "user/constantItemManage";
      }
    //跳转到更新界面
    @RequestMapping(value = "/update_constant", method = RequestMethod.GET)
    public String goToConstantEdit(int id, Model model) {
        ConstantItem constantItem = constantService.selectByPrimaryKey(id);
        System.out.println("cc:"+constantItem);
        model.addAttribute("constantItem", constantItem);
        return "user/constantEdit";
    }
    //更新
    @RequestMapping(value = "/update_constant", method = RequestMethod.POST)
    public String updateConstant(@ModelAttribute("constantItem") ConstantItem constantItem, Model model) {
        constantService.updateConstant(constantItem);
        model.addAttribute("msg", "修改成功");
        return "forward:gotoConstantItem";
    }
    //删除
    @RequestMapping("/delete_constant")
    public String delUser(int id) {
        constantService.deleteConstantById(id);
        return "forward:gotoConstantItem";
    }
    //添加
    @RequestMapping("/gotoAddConstantItem")
    public String gotoAddConstantItem(Model model){
        return "user/constantAdd";
    }
    @RequestMapping(value = "/AddConstant", method = RequestMethod.POST)
    public String AddConstant(@ModelAttribute("constantItem") ConstantItem constantItem, Model model) {
        constantService.addConstant(constantItem);
        model.addAttribute("msg", "添加成功");
        return "forward:gotoConstantItem";
    }

    @RequestMapping("/getConstantTypeList")
    public String getConstantTypeList(@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,
                                      @RequestParam(value = "pageSize",defaultValue = "5")  Integer pageSize,
                                      Model model, @ModelAttribute("constantname")String constantname){
        PageHelper.startPage(pageNum,pageSize);
        List<ConstantType> constTypeList = constantService.getConstantTypeList(constantname);
        PageInfo<department> page = new PageInfo(constTypeList);
        model.addAttribute("page",page);
        model.addAttribute("constTypeList",constTypeList);
        return "constantType/constantTypeList";
    }

    //删除常数项类型
    @RequestMapping("/delConstantType")
    public String delConstantType(int id) {
        constantService.deleteConstantById(id);
        return "forward:getConstantTypeList";

    }

    //跳转到更新界面
    @RequestMapping(value = "/updateConstantType", method = RequestMethod.GET)
    public String gotoupdateConstantType(int id, Model model) {
        ConstantType constantTypee = constantService.getConstantTypeById(id);
        model.addAttribute("constantTypee", constantTypee);
        return "constantType/constantTypeEdit";
    }

    //更新
    @RequestMapping(value = "/updateConstantType", method = RequestMethod.POST)
    public String updateConstantType(@ModelAttribute("constantTypee") ConstantType constantType, Model model) {
        constantService.updateConstantType(constantType);
        model.addAttribute("msg", "修改成功");
        return "constantType/constantTypeEdit";
    }

    @RequestMapping("/goToAddConstantType")
    public String goToAddConstantType(Model model){
        return "constantType/constantTypeAdd";
    }

    @RequestMapping("/addConstantType")
    public String addConstantType(HttpServletRequest request, ConstantType constantType) {
        constantService.insertConstantType(constantType);
        request.setAttribute("msg","添加成功");
        return "constantType/constantTypeAdd";
    }
}
