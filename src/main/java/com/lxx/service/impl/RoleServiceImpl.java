package com.lxx.service.impl;

import com.lxx.mapper.RoleMapper;
import com.lxx.pojo.Role;
import com.lxx.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleMapper roleMapper;

    @Override
    public List<Role> getRolesbyEmpId(long empId) {
        return roleMapper.getRolesbyEmpId(empId);
    }
}
