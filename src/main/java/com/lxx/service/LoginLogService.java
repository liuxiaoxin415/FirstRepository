package com.lxx.service;

import com.lxx.pojo.Loginlog;

import java.util.List;

public interface LoginLogService {

    public int addLoginLog(Loginlog loginlog);

    public List<Loginlog> getLastLoginLog(String no);
}
