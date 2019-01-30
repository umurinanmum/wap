package com.wap.helper;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonHelper {
    public static String toJson(Object source) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.writeValueAsString(source);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
