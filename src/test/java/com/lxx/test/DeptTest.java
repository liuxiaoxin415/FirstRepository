package com.lxx.test;

import com.lxx.mapper.DeptMapper;
import com.lxx.mapper.EmpMapper;
import com.lxx.pojo.Depart;
import com.lxx.service.DeptService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class DeptTest {

    @Autowired
    DeptMapper deptMapper;

    @Autowired
    EmpMapper empMapper;

    @Test
    public void test() {
        List<Depart> depts = deptMapper.findDepts();
        for (Depart depart : depts) {
            System.out.println(depart.getDname());
        }
    }


}
