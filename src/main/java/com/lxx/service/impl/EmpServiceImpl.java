package com.lxx.service.impl;

import com.lxx.service.EmpService;
import com.lxx.mapper.EmpMapper;
import com.lxx.pojo.Emp;
import com.lxx.util.TongJi;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    @Resource
    EmpMapper empMapper;

    @Override
    public Emp login(Emp emp) {
        return empMapper.login(emp);
    }

    @Override
    public int addEmp(Emp emp) {
        return empMapper.addEmp(emp);
    }

    @Override
    public int getTotolCount() {
        return empMapper.getTotolCount();
    }

    @Override
    public List<Emp> getEmps(int pageIndex, int pageSize) {
        return empMapper.getEmps(pageIndex, pageSize);
    }

    @Override
    public List<TongJi> getEmpInfo() {
        return empMapper.getEmpInfo();
    }
}
