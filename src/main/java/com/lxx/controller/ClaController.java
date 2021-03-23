package com.lxx.controller;

import com.lxx.pojo.Cla;
import com.lxx.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ClaController {

    @Autowired
    ClassService classService;

    @ResponseBody
    @RequestMapping("/getClassInfo")
    public List<Cla> getClassInfo() {
        List<Cla> classInfo = classService.getClassInfo();
        System.out.println(classInfo);
        System.out.println("getClassInfo");
        return classInfo;
    }
}
