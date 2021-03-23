package com.lxx.service.impl;

import com.lxx.mapper.LoginLogMapper;
import com.lxx.pojo.Loginlog;
import com.lxx.service.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginLogServiceImpl implements LoginLogService {

    @Autowired
    LoginLogMapper loginLogMapper;

    @Override
    public int addLoginLog(Loginlog loginlog) {
        return loginLogMapper.addLoginLog(loginlog);
    }

    @Override
    public List<Loginlog> getLastLoginLog(String no) {
        return loginLogMapper.getLastLoginLog(no);
    }
}
