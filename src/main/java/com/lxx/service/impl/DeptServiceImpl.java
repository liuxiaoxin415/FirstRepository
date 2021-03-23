package com.lxx.service.impl;

import com.lxx.mapper.DeptMapper;
import com.lxx.pojo.Depart;
import com.lxx.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    DeptMapper deptMapper;

    @Override
    public int addDept(Depart depart) {
        return deptMapper.addDept(depart);
    }

    @Override
    public int getTotolCount() {
        return deptMapper.getTotolCount();
    }

    @Override
    public List<Depart> getDepts(int pageIndex, int pageSize) {
        return deptMapper.getDepts(pageIndex, pageSize);
    }

    @Override
    public int delDept(int id) {
        return deptMapper.delDept(id);
    }

    @Override
    public List<Depart> findDepts() {
        return deptMapper.findDepts();
    }
}
