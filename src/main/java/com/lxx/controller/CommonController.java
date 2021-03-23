package com.lxx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

    @RequestMapping("/page_{page}")
    public String toPage(@PathVariable("page") String page) {
        return page;
    }

//    @RequestMapping("/toIndex")
//    public String toIndex(){
//        return "/WEB-INF/jsp/index.jsp";
//    }
//
//    @RequestMapping("/toClock")
//    public String toClock(){
//        return "/WEB-INF/jsp/clock.jsp";
//    }
}
