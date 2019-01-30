package com.wap.entity;


import com.wap.entity.interfaces.AbstractEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

public class TaskEntity extends AbstractEntity {

    @Getter
    @Setter
    private String name;

    @Getter
    @Setter
    private Date requiredBy;

    @Getter
    @Setter
    private CategoryEntity category;

    @Getter
    @Setter
    private int priority;

    @Getter
    @Setter
    private UserEntity user;

    @Getter
    @Setter
    private boolean isCompleted;
}
