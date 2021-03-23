package com.lxx.service;

import com.lxx.pojo.Depart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptService {

    public int addDept(Depart depart);

    public int getTotolCount();

    public List<Depart> getDepts(@Param("pageIndex") int pageStart, @Param("pageSize") int pageSize);

    public int delDept(int id);

    public List<Depart> findDepts();
}
