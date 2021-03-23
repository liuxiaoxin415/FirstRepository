package com.lxx.service;

import com.lxx.pojo.Role;

import java.util.List;

public interface RoleService {

    public List<Role> getRolesbyEmpId(long empId);

}
