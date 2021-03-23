package com.lxx.controller;

import com.alibaba.fastjson.JSONObject;
import com.lxx.pojo.Depart;
import com.lxx.service.DeptService;
import com.lxx.util.PageUtil;
import com.lxx.util.ResultMessage;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DeptController {

    @Autowired
    DeptService deptService;

    @RequestMapping("/dept_list/{pageIndex}/{pageSize}")
    public String dept_list(@PathVariable("pageIndex") int pageIndex, @PathVariable("pageSize") int pageSize, Model model) {
        int totolCount = deptService.getTotolCount();
        List<Depart> depts = deptService.getDepts((pageIndex - 1) * pageSize, pageSize);
        PageUtil pageUtil = new PageUtil(pageIndex, pageSize, totolCount, depts);
        //System.out.println(pageUtil);
        model.addAttribute("pageUtil", pageUtil);
        return "departlist";
    }

    @ResponseBody
    @RequestMapping("/dept_add")
    public ResultMessage addDept(Depart depart) {
        ResultMessage message = null;
        //System.out.println("要新增的部门： "+depart);
        int i = deptService.addDept(depart);
        if (i > 0) {
            message = new ResultMessage(200, "部门添加成功");
        } else {
            message = new ResultMessage(500, "部门添加失败");
        }
        return message;
    }

    @ResponseBody
    @RequestMapping("/del_dept")
    public ResultMessage del_dept(int id) {
        ResultMessage message = null;
        int count = deptService.delDept(id);
        if (count > 0) {
            message = new ResultMessage(200, "部门删除成功");
        } else {
            message = new ResultMessage(500, "部门删除失败");
        }
        return message;
    }

    /**
     * 查询部门信息显示在下拉框
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/findDepts")
    public List<Depart> findDepts() {
        List<Depart> depts = deptService.findDepts();
        return depts;
    }


}
