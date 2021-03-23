package com.lxx.service.impl;

import com.lxx.mapper.StudentMapper;
import com.lxx.pojo.Student;
import com.lxx.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StudnetServiceImpl implements StudentService {

    @Autowired
    StudentMapper studentMapper;

    @Override
    public int getTotolCount(Map<String, Object> map) {
        return studentMapper.getTotolCount(map);
    }

    @Override
    public List<Student> getStudents(Map<String, Object> map) {
        return studentMapper.getStudents(map);
    }

    @Override
    public List<Student> getExcelStudents(Map<String, Object> map) {
        return studentMapper.getExcelStudents(map);
    }
}
