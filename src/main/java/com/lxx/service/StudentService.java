package com.lxx.service;

import com.lxx.pojo.Student;

import java.util.List;
import java.util.Map;

public interface StudentService {

    //查询学生总数
    public int getTotolCount(Map<String, Object> map);

    public List<Student> getStudents(Map<String, Object> map);

    public List<Student> getExcelStudents(Map<String, Object> map);


}
