package com.wap.model;

import lombok.Getter;
import lombok.Setter;

public class WapResultData<T> extends WapResult {
    @Getter
    @Setter
    private T data;
}
