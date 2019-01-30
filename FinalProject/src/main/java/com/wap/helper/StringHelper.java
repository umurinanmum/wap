package com.wap.helper;

public class StringHelper {

    public static boolean isNullOrEmpty(String source) {
        if (source == null || source.trim().isEmpty()) {
            return true;
        }
        return false;
    }
}
