package com.lxx.mapper;

import com.lxx.pojo.Depart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptMapper {

    //添加部门信息
    public int addDept(Depart depart);

    //查询部门总数
    public int getTotolCount();

    /**
     * 查询所有部门信息
     *
     * @return
     */
    public List<Depart> getDepts(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);

    public int delDept(int id);

    public List<Depart> findDepts();
}


