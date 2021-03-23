package com.lxx.util;

import lombok.Getter;

@Getter
public class ResultMessage {
    private int status;//状态码
    private String message;//信息

    public ResultMessage(int status, String message) {
        this.status = status;
        this.message = message;
    }

}
