package com.wap.entity;

import com.wap.entity.interfaces.AbstractEntity;
import lombok.Getter;
import lombok.Setter;

public class CategoryEntity extends AbstractEntity {

    @Getter
    @Setter
    private String name;
}
