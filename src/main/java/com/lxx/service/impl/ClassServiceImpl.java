package com.lxx.service.impl;

import com.lxx.mapper.ClaMapper;
import com.lxx.pojo.Cla;
import com.lxx.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ClassServiceImpl implements ClassService {

    @Autowired
    ClaMapper claMapper;

    @Override
    public List<Cla> getClassInfo() {
        return claMapper.getClassInfo();
    }
}
