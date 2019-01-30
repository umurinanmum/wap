package com.wap.entity;

import com.wap.entity.interfaces.IEntity;
import lombok.Getter;
import lombok.Setter;

public class CategoryEntity extends IEntity {

    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    private String name;
}
