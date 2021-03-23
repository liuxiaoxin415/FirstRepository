package com.lxx.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cla {

    private long id;
    private long majorId;
    private String className;
    private java.sql.Date classDate;
    private String classTime;
    private String classAddress;
    private long classDelete;

}
