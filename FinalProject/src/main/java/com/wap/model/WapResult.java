package com.wap.model;

import com.wap.enums.StatusCode;
import com.wap.helper.JsonHelper;
import lombok.Getter;
import lombok.Setter;

public class WapResult {
    @Getter
    @Setter
    private StatusCode statusCode;

    @Getter
    @Setter
    private String message;

    public WapResult success() {
        this.statusCode = StatusCode.SUCCESS;
        return this;
    }

    public String asJson(){
        return JsonHelper.toJson(this);
    }
}
