package com.cyl.hospital.controller;


import com.cyl.hospital.beans.*;
import com.cyl.hospital.service.CIItemAndApplyService;
import com.cyl.hospital.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/ciitem")
public class CIItemAndApplyController {

    @Autowired
    CIItemAndApplyService ciItemAndApplyService;
    @Autowired
    RegisterService registerService;


    @RequestMapping("/getCheckApplyList")
    public String GetCheckList(Model model){
        List<checkInspectItemInfo> checkList = ciItemAndApplyService.getCheckItemList();
        model.addAttribute("checkList",checkList);
        return "/medical/checkApply";
    }

    @RequestMapping("getInpeckApplyList")
    public String getInpeckApplyList(Model model){
        List<checkInspectItemInfo> inspectList = ciItemAndApplyService.getInspectItemList();
        model.addAttribute("inspectList",inspectList);
        return "/medical/inpeckApply";
    }
    //开立检查项目
    @RequestMapping("/openCheckProject")
    @ResponseBody
    public String openCheckProject(String caseNumber, CIApplyRecordList ciApplyRecordList, HttpSession session){
        System.out.println(ciApplyRecordList);
        userInfo user = (userInfo)session.getAttribute("userInfo");
        registerInfo register = registerService.getRegisterByCaseNumber(caseNumber);
        if(user.getUserId() == register.getDoctorId()){
            for (ciApplyRecord ciar:ciApplyRecordList.getCiApplyRecordList()){
                if(ciar.getItemId()!=0){
                    ciar.setCaseNumber(caseNumber);
                    ciar.setRegisterId(register.getRegisterId());
                    ciar.setDoctorId(register.getDoctorId());
                    ciar.setPayStatus(1);//1未付款 2 已付款
                    ciar.setRecordType(1);//检查项目 2 检验项目
                    ciItemAndApplyService.addApplyRecord(ciar);//添加项目申请记录
                }
            }
            return "开立成功";
        }else {
            return "该患者不是当前医生的患者，不能进行检查的申请";
        }
    }

    //开立检验项目
    @RequestMapping("/openInspectProject")
    @ResponseBody
    public String openInspectProject(String caseNumber, CIApplyRecordList ciApplyRecordList,HttpSession session){
        System.out.println(ciApplyRecordList);
        userInfo user = (userInfo)session.getAttribute("userInfo");
        registerInfo register = registerService.getRegisterByCaseNumber(caseNumber);
        if(user.getUserId()==register.getDoctorId()){
            for (ciApplyRecord ciar:ciApplyRecordList.getCiApplyRecordList()){
                if(ciar.getItemId()!=0){
                    ciar.setCaseNumber(caseNumber);
                    ciar.setRegisterId(register.getRegisterId());
                    ciar.setDoctorId(register.getDoctorId());
                    ciar.setPayStatus(1);//1未付款 2 已付款
                    ciar.setRecordType(2);//检查项目 2 检验项目
                    ciItemAndApplyService.addApplyRecord(ciar);//添加项目申请记录
                }
            }
            return "开立成功";
        }else {
            return "该患者不是当前医生的患者，不能进行检查的申请";
        }
    }
}
