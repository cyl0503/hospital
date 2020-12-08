package com.cyl.hospital.controller;


import com.cyl.hospital.beans.SettleCategory;
import com.cyl.hospital.service.SettleCategoryService;
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
@RequestMapping("/settleCategory")
public class SettleCategoryController {
    @Autowired
    SettleCategoryService settleCategoryService;

    @RequestMapping("/getSettleCategoryList")
    public String getSettleCategoryList(@RequestParam(value="pageNum",defaultValue="1") Integer pageNum,
                                        @RequestParam(value = "pageSize",defaultValue = "5")  Integer pageSize,
                                        Model model, @ModelAttribute("settlename")String settlename){
        PageHelper.startPage(pageNum,pageSize);
        List<SettleCategory> settleCategoryList = settleCategoryService.getAllSettleCategory(settlename);
        PageInfo<SettleCategory> page = new PageInfo(settleCategoryList);
        model.addAttribute("page",page);
        model.addAttribute("settleCategoryList",settleCategoryList);
        return "settleCategory/settleCategoryList";
    }

    //删除科室
    @RequestMapping("/delSettleCategory")
    public String delSettleCategory(int id) {
        settleCategoryService.delSettleCategoryById(id);
        return "forward:getSettleCategoryList";

    }

    //跳转到更新界面
    @RequestMapping(value = "/updateSettleCategory", method = RequestMethod.GET)
    public String updateSettleCategory(int id, Model model) {
        SettleCategory settleCategoryy = settleCategoryService.getSettleCategoryById(id);
        model.addAttribute("settleCategoryy", settleCategoryy);
        return "settleCategory/settleCategoryEdit";
    }

    //更新
    @RequestMapping(value = "/updateSettleCategory", method = RequestMethod.POST)
    public String updateSettleCategory(@ModelAttribute("settleCategoryy") SettleCategory settleCategory, Model model) {
        settleCategoryService.updateSettleCategory(settleCategory);
        model.addAttribute("msg", "修改成功");
        return "settleCategory/settleCategoryEdit";
    }

    @RequestMapping("/goToAddSettleCategory")
    public String goToAddSettleCategory(Model model){
        return "settleCategory/settleCategoryAdd";
    }

    @RequestMapping("/addSettleCategory")
    public String addSettleCategory(HttpServletRequest request, SettleCategory settleCategory) {
        settleCategoryService.insertSettleCategory(settleCategory);
        request.setAttribute("msg","添加成功");
        return "settleCategory/settleCategoryAdd";
    }
}
