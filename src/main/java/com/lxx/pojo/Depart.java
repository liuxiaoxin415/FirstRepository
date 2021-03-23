package com.lxx.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Depart {

    private long id;
    private String dname;
    private String createtime;
    private long del;

}
