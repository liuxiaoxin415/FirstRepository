package com.lxx.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {

    private long id;
    private String no;
    private String name;
    private String sex;
    private String birthday;
    private String cardno;
    private String school;
    private String education;
    private long classID;
    private long flag;
    private String email;
    private String qq;
    private String phone;
    private String createdate;
    private String photo;
    private long del;
    private Cla cla;

}
