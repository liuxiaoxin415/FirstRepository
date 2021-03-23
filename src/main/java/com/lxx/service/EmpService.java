package com.lxx.service;

import com.lxx.pojo.Emp;
import com.lxx.util.TongJi;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpService {

    public Emp login(Emp emp);

    public int addEmp(Emp emp);

    //查询员工总数
    public int getTotolCount();

    /**
     * 查询员工分页信息
     *
     * @return
     */
    public List<Emp> getEmps(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);

    public List<TongJi> getEmpInfo();

}
