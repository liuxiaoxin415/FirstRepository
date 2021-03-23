package com.lxx.controller;

import com.alibaba.fastjson.JSONObject;
import com.lxx.pojo.Depart;
import com.lxx.pojo.Emp;
import com.lxx.pojo.Loginlog;
import com.lxx.pojo.Role;
import com.lxx.service.DeptService;
import com.lxx.service.EmpService;
import com.lxx.service.LoginLogService;
import com.lxx.service.RoleService;
import com.lxx.util.PageUtil;
import com.lxx.util.ResultMessage;
import com.lxx.util.TongJi;
import com.sun.deploy.net.HttpResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class EmpController {

    @Autowired
    EmpService empService;
    @Autowired
    DeptService deptService;
    @Autowired
    LoginLogService loginLogService;
    @Autowired
    RoleService roleService;

    @RequestMapping("/emp_login")
    @ResponseBody
    public ResultMessage login(String ip, String address, Emp emp, HttpServletResponse response, HttpSession session) throws Exception {

        System.out.println("要登录的账号是" + emp.getNo());

        ResultMessage message = null;
        response.setContentType("text/html;charset=utf-8");

        Emp empLogin = empService.login(emp);
        if (empLogin != null) {

            if (empLogin.getFlag() == 1) {

                //获取主题
                Subject subject = SecurityUtils.getSubject();
                //生成令牌
                UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(empLogin.getNo(), empLogin.getPass());
                //告知Shiro
                subject.login(usernamePasswordToken);
                //获取Shrio的Session
                Session shiroSession = subject.getSession();
                session.setAttribute("empLogin", empLogin);

                //存储用户的IP和address
                Loginlog loginlog = new Loginlog(ip, emp.getNo(), address);
                int count = loginLogService.addLoginLog(loginlog);
                System.out.println(count > 0 ? "日志新增成功" : "日志新增失败");
                //将用户信息存入session中
                //session.setAttribute("empLogin", empLogin);
                List<Role> roles = roleService.getRolesbyEmpId(empLogin.getId());

                StringBuffer stringBuffer = new StringBuffer();
                for (Role role : roles) {
                    stringBuffer.append(role.getRName() + " ");
                }
                shiroSession.setAttribute("rolesName", stringBuffer.toString());
                message = new ResultMessage(200, "登陆成功");
            } else {
                message = new ResultMessage(300, "账号已经被禁用，请联系管理员!");
            }
        } else {
            message = new ResultMessage(500, "账号密码错误!");
        }

        return message;
    }

    @RequestMapping("/getLoginlog")
    @ResponseBody
    public List<Loginlog> getLoginlog(HttpSession session) {
        //从session中取出用户信息
        Emp emp = (Emp) session.getAttribute("empLogin");

        //System.out.println("---------------------");
        //System.out.println(loginlog);

        String no = emp.getNo();

        //System.out.println(no);


        return loginLogService.getLastLoginLog(no);
    }

    @RequestMapping("/addEmp")
    @ResponseBody
    public ResultMessage addEmp(Emp emp) {
        ResultMessage message = null;
        int count = empService.addEmp(emp);
        if (count > 0) {
            message = new ResultMessage(200, "员工添加成功");
        } else {
            message = new ResultMessage(500, "员工添加失败");
        }
        return message;
    }

    @RequestMapping("/emp_list/{pageIndex}/{pageSize}")
    public String dept_list(@PathVariable("pageIndex") int pageIndex, @PathVariable("pageSize") int pageSize, Model model) {
        int totolCount = empService.getTotolCount();
        List<Emp> emps = empService.getEmps((pageIndex - 1) * pageSize, pageSize);
        PageUtil pageUtil = new PageUtil(pageIndex, pageSize, totolCount, emps);
        //System.out.println(pageUtil);
        model.addAttribute("pageUtil", pageUtil);
        return "emplist";
    }

    @RequestMapping("/getTongJiData")
    public String getTongJiData(Model model) {
        List<String> dnames = new ArrayList<String>();

        List<TongJi> empInfo = empService.getEmpInfo();
        List<Depart> depts = deptService.findDepts();

        for (Depart depart : depts) {
            dnames.add(depart.getDname());
        }
        String jsonDnames = JSONObject.toJSONString(dnames);
        String jsonCounts = JSONObject.toJSONString(empInfo);

        model.addAttribute("jsonDnames", jsonDnames);
        model.addAttribute("jsonCounts", jsonCounts);

        return "empCount";
    }

    @RequestMapping("/emp_logout")
    public void logout(HttpServletResponse response) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        response.sendRedirect("login.jsp");
    }

}
