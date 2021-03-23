package com.lxx.test;

import com.alibaba.fastjson.JSONObject;
import com.lxx.mapper.ClaMapper;
import com.lxx.mapper.DeptMapper;
import com.lxx.mapper.EmpMapper;
import com.lxx.pojo.Cla;
import com.lxx.pojo.Depart;
import com.lxx.pojo.Emp;
import com.lxx.util.TongJi;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class MyBatisTest {

    @Autowired
    public EmpMapper empMapper;

    @Autowired
    DeptMapper deptMapper;

    @Autowired
    ClaMapper claMapper;


    @Test
    public void testLogin() {
        Emp emp = new Emp();
        emp.setNo("qf000001");
        emp.setPass("admin");
        Emp emp1 = empMapper.login(emp);
        System.out.println(emp1);
    }

    @Test
    public void test() {
        List<String> list = new ArrayList<String>();
        List<Depart> depts = deptMapper.findDepts();
        for (Depart depart : depts) {
            list.add(depart.getDname());
        }
        String jsonString = JSONObject.toJSONString(list);
        System.out.println(jsonString);

    }

    @Test
    public void test1() {
        List<TongJi> empInfo = empMapper.getEmpInfo();
        String jsonString = JSONObject.toJSONString(empInfo);
        System.out.println(jsonString);
    }

    @Test
    public void test2() {
        List<Cla> classInfo = claMapper.getClassInfo();
        System.out.println(classInfo);
    }

}
