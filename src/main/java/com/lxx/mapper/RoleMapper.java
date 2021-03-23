package com.lxx.mapper;

import com.lxx.pojo.Role;

import java.util.List;

public interface RoleMapper {

    public List<Role> getRolesbyEmpId(long empId);

}
