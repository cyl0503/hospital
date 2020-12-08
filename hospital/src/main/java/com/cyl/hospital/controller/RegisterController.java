package com.cyl.hospital.controller;


import com.cyl.hospital.beans.*;
import com.cyl.hospital.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    RegisterService registerService;
    @Autowired
    DepartmentService departmentService;
    @Autowired
    RegisterLevelService registerLevelService;
    @Autowired
    UserInfoService userInfoService;
    @Autowired
    CIItemAndApplyService ciItemAndApplyService;
    @Autowired
    PatientCostsService patientCostsService;
    @Autowired
    SettleCategoryService settleCategoryService;

    @RequestMapping(value = "/getRegister")
    public String getAllUser(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                             @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                             Model model) {
        //获取病历号
        String caseNumber = registerService.getCaseNumber();
        model.addAttribute("caseNumber",caseNumber);
        String realName = "";
        //科室列表
        List<department> deptList=departmentService.getAllDepartment("");
        model.addAttribute("deptList",deptList);
        //挂号级别列表
        List<registerLevel> reglevList = registerLevelService.getAllRegisterLevel();
        model.addAttribute("reglevList",reglevList);
        PageHelper.startPage(pageNum, pageSize);
        return "register/register";
    }

    @RequestMapping("/getDoctorByDeptAndRegisterLevel")
    @ResponseBody
    public List<userInfo> getDoctorByDeptAndRegisterLevel(String levelName, String deptName){
        Map<Object,Object> map = new HashMap<Object, Object>();
        map.put("levelName",levelName);
        map.put("deptName",deptName);
        List<userInfo> userList = userInfoService.getDoctorByDeptAndRegisterLevel(map);
        return userList;
    }

    @RequestMapping("/getDoctorQuota")
    @ResponseBody
    public String getDoctorQuota(int doctorId){
        int levelQuota = userInfoService.getlevelQuota(doctorId);
        int usedlevelQuota = userInfoService.getUsedlevelQuota(doctorId);
        return levelQuota+"-"+usedlevelQuota;
    }
    //挂号
    @RequestMapping("/patientRegister")
    public String patientRegister(registerInfo register, HttpSession session, Model model){
        userInfo user = (userInfo)session.getAttribute("userInfo");
        register.setRegisterId(user.getUserId());
        register.setStatus(1);  //1 已挂号
        registerService.addRegister(register);
        String caseNumber =registerService.getCaseNumber();
        model.addAttribute("caseNumber",caseNumber);
        model.addAttribute("msg","挂号成功");
        return "register/register";
    }
    //查询患者挂号信息列表
    @RequestMapping("/getRegisterList")
    @ResponseBody
    public List<registerInfo> getRegisterList(@RequestParam(required = true,defaultValue="1") int pageNum){
        int pageSize = 3;
        PageHelper.startPage(pageNum,pageSize);
        List<registerInfo> registerList = registerService.getRegisterList();
        PageInfo<registerInfo> page = new PageInfo<registerInfo>(registerList);
        return  registerList;
    }
    //跳转到退号界面
    @RequestMapping(value = "/refund", method = RequestMethod.GET)
    public String goToUserEdit() {
        return "register/refund";
    }
    @RequestMapping(value = "/refund", method = RequestMethod.POST)
    @ResponseBody
    public registerInfo getrefund(String caseNumber) {
        registerService.updateRegisterStatus(caseNumber);
        registerInfo register = registerService.getRegisterByCaseNumber(caseNumber);
        return register;
    }
    //根据病历号查询患者信息
    @RequestMapping("/searchByCaseNumber")
    @ResponseBody
    public registerInfo getDataByCaseNumber(String scaseNumber) {
        registerInfo register = registerService.getRegisterByCaseNumber(scaseNumber);
        return register;
    }

    @RequestMapping("/getPatientMedicalRecordByCaseNumber")
    @ResponseBody
    public registerInfo getPatientMedicalRecordByCaseNumber(String scaseNumber){
        registerInfo register = registerService.getPatientMedicalRecordByCaseNumber(scaseNumber);
        System.out.println("r:"+register);
        return register;
    }

    @RequestMapping("/GoToRegisterFee")
    public String GoToRegisterFee(){
        return "register/registerFee";
    }

    @RequestMapping("/getPatientCIApplyRecord")
    @ResponseBody
    public List<registerInfo> getPatientCIApplyRecord(String scaseNumber){
        List<registerInfo> registerApplyRecordList = registerService.getPatientCIApplyRecord(scaseNumber);
        return registerApplyRecordList;
    }
    //结算收费
    @RequestMapping("/updatePatientCIApplyRecordStatus")
    @ResponseBody
    public List<registerInfo> updateRegisterCIApplyRecordStatus(String caseNumber,String[] itemIds,HttpSession session){

        userInfo user = (userInfo)session.getAttribute("userInfo");

        Map<Object,Object> map = new HashMap<Object, Object>();
       map.put("caseNumber",caseNumber);
       map.put("itemIds",itemIds);
       ciItemAndApplyService.updatePatientCIApplrRecordStatus(map);
       
       List<registerInfo> registerApplyRecordList = registerService.getPatientCIApplyRecord(caseNumber);
       
       for(String strItemId: itemIds){
           int itemId = Integer.parseInt(strItemId);

           for(registerInfo register:registerApplyRecordList){
                if(itemId == register.getApplyRecord().getItemId()){
                    PatientCosts patientCosts = new PatientCosts();
                    patientCosts.setCasenumber(caseNumber);
                    patientCosts.setItemid(itemId);
                    patientCosts.setItemname(register.getApplyRecord().getItemName());
                    patientCosts.setItemtype(register.getType());  //检查，检验项类型
                    patientCosts.setNumber(register.getApplyRecord().getNumber());
                    patientCosts.setPrice(register.getPrice());
                    patientCosts.setTotal(register.getApplyRecord().getTotal());
                    patientCosts.setCreatetime(register.getApplyRecord().getCreateTime());
                    patientCosts.setDoctorid(register.getApplyRecord().getDoctorId());
                    patientCosts.setRegisterid(user.getUserId());//收费人员id
                    patientCosts.setFeetype(1);
                    patientCostsService.addPatientCosts(patientCosts);
                }
           }
       }
        return registerApplyRecordList;
    }
    //弹出页面结算收费
    @RequestMapping("/updatePatientCIApplyRecordStatus1")
    public String updateRegisterCIApplyRecordStatus1(String caseNumber,String itemIds,int feeType,HttpSession session){

        userInfo user = (userInfo)session.getAttribute("userInfo");
        String [] arrItemIds = itemIds.split(",");
        Map<Object,Object> map = new HashMap<Object, Object>();
        map.put("caseNumber",caseNumber);
        map.put("itemIds",arrItemIds);
        ciItemAndApplyService.updatePatientCIApplrRecordStatus(map);
        List<registerInfo> registerApplyRecordList = registerService.getPatientCIApplyRecord(caseNumber);
        for(String strItemId: arrItemIds){
            int itemId = Integer.parseInt(strItemId);
            for(registerInfo register:registerApplyRecordList){
                if(itemId == register.getApplyRecord().getItemId()){
                    PatientCosts patientCosts = new PatientCosts();
                    patientCosts.setCasenumber(caseNumber);
                    patientCosts.setItemid(itemId);
                    patientCosts.setItemname(register.getApplyRecord().getItemName());
                    patientCosts.setItemtype(register.getType());  //检查，检验项类型
                    patientCosts.setNumber(register.getApplyRecord().getNumber());
                    patientCosts.setPrice(register.getPrice());
                    patientCosts.setTotal(register.getApplyRecord().getTotal());
                    patientCosts.setCreatetime(register.getApplyRecord().getCreateTime());
                    patientCosts.setDoctorid(register.getApplyRecord().getDoctorId());
                    patientCosts.setRegisterid(user.getUserId());//收费人员id
                    patientCosts.setFeetype(feeType); //结算方式
                    patientCostsService.addPatientCosts(patientCosts);
                }
            }
        }
        return "register/registerSettle";
    }
    //查询所有结算类别
    @RequestMapping("/getSettleCategoryList")
    public String getSettleCategoryList(Model model,String realName,String caseNumber,double total,String[] itemids){
        String str="";
        for (String s:itemids){
            str += s + ",";
        }
        List<SettleCategory> settleCategoryList =settleCategoryService.getSettleCategoryList();
        model.addAttribute("settleCategoryList",settleCategoryList);
        model.addAttribute("realName",realName);
        model.addAttribute("caseNumber",caseNumber);
        model.addAttribute("total",total);
        model.addAttribute("str",str);
        return "register/registerSettle";
    }

    @RequestMapping("/getPatientCostsList")
    public String getPatientCostsList(){
       return "register/patientCosts";
    }
}
