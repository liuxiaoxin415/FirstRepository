package com.lxx.mapper;

import com.lxx.pojo.Loginlog;

import java.util.List;

public interface LoginLogMapper {

    //添加用户登录ip和address
    public int addLoginLog(Loginlog loginlog);

    //查询最近登录的ip和address
    public List<Loginlog> getLastLoginLog(String no);

}
