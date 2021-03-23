package com.lxx.mapper;

import com.lxx.pojo.Depart;
import com.lxx.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentMapper {

    //查询学生总数
    public int getTotolCount(Map<String, Object> map);

    public List<Student> getStudents(Map<String, Object> map);

    //取出Excel要导出的数据
    public List<Student> getExcelStudents(Map<String, Object> map);

}
