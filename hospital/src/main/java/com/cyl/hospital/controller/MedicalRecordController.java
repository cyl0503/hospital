package com.cyl.hospital.controller;

import com.cyl.hospital.beans.medicalRecord;
import com.cyl.hospital.beans.registerInfo;
import com.cyl.hospital.beans.userInfo;
import com.cyl.hospital.mapper.MedicalRecordMapper;
import com.cyl.hospital.service.MedicalRecordService;
import com.cyl.hospital.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/medical")
public class MedicalRecordController {

    @Autowired
    RegisterService registerService;
    @Autowired
    MedicalRecordService medicalRecordService;

    @RequestMapping("/medicalRecordList")
    public String getRegisterListToMedicalRecord(Model model, HttpSession session){
        userInfo user = (userInfo)session.getAttribute("userInfo");
        List<registerInfo> registerHaveList = registerService.getRegisterByDoctorHave(user.getUserId());
        List<registerInfo> registerNotList = registerService.getRegisterByDoctorNot(user.getUserId());
        model.addAttribute("registerHaveList",registerHaveList);
        model.addAttribute("registerNotList",registerNotList);
        return "medical/medicalRecordList";
    }

    @RequestMapping("/updateRegisterStatusToMedicalRecord")
    public String goTOMedicalRecordHomePage(String caseNumber,int flag,Model model){
        //System.out.println(caseNumber);
        if(flag==1){    //医生首次接诊
            registerService.updateRegisterStatusDocAccept(caseNumber);
        }else if(flag==2){  //医生在诊毕之前的看诊
            medicalRecord mdr = medicalRecordService.getMedicalRecordByCaseNumber(caseNumber);
            System.out.println("mdr:"+mdr);
            model.addAttribute("mdr",mdr);
        }
        registerInfo register = registerService.getRegisterByCaseNumber(caseNumber);
        System.out.println("111re:"+register);
        model.addAttribute("register",register);
        return "medical/medicalRecordHomePage";
    }

    @RequestMapping("/saveMedicalRecord")
    @ResponseBody
    public medicalRecord saveMedicalRecord(int flag,medicalRecord medRecord){
       String caseNumber = medRecord.getCaseNumber(); //病历号
        // System.out.println("病历号："+caseNumber);
       registerInfo register = registerService.getRegisterByCaseNumber(caseNumber);
       int registerId = register.getRegisterId();
       medRecord.setRegisterId(registerId);   //添加挂号人员id
       medicalRecord medicalRecordByCaseNumber = medicalRecordService.getMedicalRecordByCaseNumber(caseNumber);
       if(flag==1){  //点击暂存按钮
          medRecord.setStatus(1);//已提交状态
          if(medicalRecordByCaseNumber!=null){
              //不是首次
            medicalRecordService.tempSaveUpdateRecord(medRecord);
          } else {
              //是首次
              medicalRecordService.tempSaveAddRecord(medRecord);
          }
       }else if(flag==2){   //点击确诊按钮
           //诊毕状态
           medRecord.setStatus(2);
           if(medicalRecordByCaseNumber!=null){
               //病例表中有数据为修改状态2 诊毕
               medicalRecordService.SaveUpdateRecord(medRecord);
           } else {
               //直接确诊 添加记录 状态为 2 诊毕
               medicalRecordService.SaveAddRecord(medRecord);
           }
           //修改患者挂号信息状态 为3 看诊结束
           registerService.updateRegisterStatusDocEnd(caseNumber);
       }
       return medRecord;
    }

    @RequestMapping("/gotomedicalRecordConfirmed")
    public String GoToMedicalRecordConfirmed(){
      return "medical/medicalRecordConfirmed";
    }
}
