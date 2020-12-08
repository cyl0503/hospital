package com.cyl.hospital.controller;

import com.cyl.hospital.beans.PatientCosts;
import com.cyl.hospital.service.PatientCostsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/patientCosts")
public class PatientCostsController {

    @Autowired
    PatientCostsService patientCostsService;

    @RequestMapping("/getPatientCostsList")
    @ResponseBody
    public List<PatientCosts> getPatientCostsList(String caseNumber){
        return patientCostsService.getPatientCostsList(caseNumber);
    }
}
